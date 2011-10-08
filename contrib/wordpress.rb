require 'rubygems'
require 'mysql'
require 'sequel'
require 'fileutils'
require 'yaml'
require 'iconv'

# NOTE: This converter requires Sequel and the MySQL gems.
# The MySQL gem can be difficult to install on OS X. Once you have MySQL
# installed, running the following commands should work:
# $ sudo gem install sequel
# $ sudo gem install mysql -- --with-mysql-config=/usr/local/mysql/bin/mysql_config

# ruby1.9 -r './wordpress.rb' -e 'Jekyll::WordPress.process()'

module Jekyll
  module WordPress

    # Reads a MySQL database via Sequel and creates a post file for each
    # post in wp_posts that has post_status = 'publish'.
    # This restriction is made because 'draft' posts are not guaranteed to
    # have valid dates.
    QUERY = "select post_title, post_name, post_date, post_content, post_excerpt, ID, guid from wp_posts where post_status = 'publish' and post_type = 'post'"
	  
	  # Fetch all tags for a given POST ID
	  TAGS_QUERY = "select tm.term_id,tm.name from wp_term_relationships tr 
				  inner join wp_term_taxonomy tt on tr.term_taxonomy_id = tt.term_taxonomy_id 
				  inner join wp_terms tm on tm.term_id=tt.term_id  
				  where tr.object_id=%d and tt.taxonomy = 'post_tag'";
		
		def self.fix_tim_code(content, title)
		  langs = ['php', 'python', 'xml', 'css', 'html', 'ruby']
		  
		  #fix urls
		  content = content.gsub("http://timbroder.com/wp-content/", "/images/wp-content/")
		  content = content.gsub("http://timbroder.com", "http://www.timbroder.com")
		  
		  #fix django templaetes so Liquid doesn't freak out
		  content = content.gsub("{%", "{{ \"{%")
      content = content.gsub("%}", "\" }}%}")
      
      #fix xml
      content = content.gsub("&lt;", "<")
      content = content.gsub("&gt;", ">")
      
      langs.each do |lang|
        #search so we try* to not blow out to many </pre>
        if(content =~ /<pre name="code" class="/) then
          puts 'found'
          content = content.gsub('<pre name="code" class="' + lang + '">', "``` " + lang + "\n")
          #eh... probably going to mess some other things up, we'll see
          content = content.gsub('</pre>', "``` \n")
        end
        
        content = content.gsub('[' + lang + ']', "``` " + lang + "\n")
        content = content.gsub('[/' + lang + ']', "```\n")
      end
      
      #fix php
      content = content.gsub("``` php\n", "``` php\n<?php\n")
      
		  return content
		end
				  
    def self.process()
      remove_markdown = true
      gem('mysql')
      puts 'init'
      ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
      db = Sequel.connect(:adapter => 'mysql', :user => 'root', :host => 'localhost', :database => 'gpowered',:password=>'root')
      puts 'have db'
      FileUtils.mkdir_p("_posts")

      # Reads a MySQL database via Sequel and creates a post file for each
      # post in wp_posts that has post_status = 'publish'. This restriction is
      # made because 'draft' posts are not guaranteed to have valid dates.
      #query = "select post_name, post_title, post_date, post_content, post_excerpt, id, guid from wp_posts where post_status = 'publish' and post_type = 'post' order by id limit 1"

            db[QUERY].each do |post|
              # Get required fields and construct Jekyll compatible name
              title = post[:post_title]
              slug = post[:post_name]
              date = post[:post_date]
              content = ic.iconv(post[:post_content] + ' ')[0..-2]
              if remove_markdown
                content = self.fix_tim_code(content, title.to_s)
              end
              name = "%02d-%02d-%02d-%s.markdown" % [date.year, date.month, date.day, slug]

      		# Get associated taxonomy terms (tags)
      		# We replace + with nothing and transform to lower case
      		# TODO: figure out what other characters would fuck up YAML
      		tags = []
      		db[TAGS_QUERY % post[:ID]].each do |tag|
      			tags << tag[:name].to_s.gsub('+','').downcase
      		end

      		# Process content to rewrite some URLs
      		#if domain
      		#        content = self.transformUrls(domain,content)
      		#end

              # Get the relevant fields as a hash, delete empty fields and convert
              # to YAML for the header
              data = {
                'layout' => 'post',
                'title' => title.to_s,
                'excerpt' => post[:post_excerpt].to_s,
                'wordpress_id' => post[:id],
                'wordpress_url' => post[:guid],
                'date' => date,
                'comments' => true,
                'tags' => tags
               }.delete_if { |k,v| v.nil? || v == ''}.to_yaml

              # Write out the data and content to file
              File.open("../source/_posts/#{name}", "w") do |f|
                f.puts data
                f.puts "---"
                f.puts content
              end
            end

          end

      	# Process the content and replace URLs pointing to wp-content/uploads/
      	# with CloudFront CNAME'd URL turbo.paulstamatiou.com/uploads/
      	#def self.transformUrls(domain,content)
      	#	baseurl = "%s/wp-content/uploads/" % domain
      	#	return content.gsub(baseurl,"turbo.paulstamatiou.com/uploads/")
      	#end

        end
      end