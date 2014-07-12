module Bridgescaffold
  module LayoutActions

    def generate_scaffold
      generate 'scaffold topic title:string description:text'
    end

    def database_migrate
      run 'rake db:migrate'
    end

    def generator_vote_model
      generate 'model vote topic_id:integer'
      build :database_migrate
    end

    def add_topic_association
      replace_in_file 'app/models/topic.rb', /class Topic < ActiveRecord::Base\nend/, "class Topic < ActiveRecord::Base\nhas_many :votes, dependent: :destroy\nend"
    end

    def add_vote_association
      replace_in_file 'app/models/vote.rb', /class Vote < ActiveRecord::Base\nend/, "class Vote < ActiveRecord::Base\nbelongs_to :topic\nend"
    end

    def change_controller_topic_create_update_path
      replace_in_file 'app/controllers/topics_controller.rb', /format.html { redirect_to @topic, notice: 'Topic was successfully created.' }/, "format.html { redirect_to topics_path, notice: 'Topic was successfully created.' }"
      replace_in_file 'app/controllers/topics_controller.rb', /format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }/, "format.html { redirect_to topics_path, notice: 'Topic was successfully updated.' }"
    end

    def add_flash_in_index
      replace_in_file 'app/views/layouts/application.html.erb', /<body>\s/, "<body>\n<% flash.each do |name, msg| %>\n<div><%= msg %></div>\n<% end %>"
    end

    def remove_somthing_description
      replace_in_file 'app/views/topics/index.html.erb', /<td><%= topic.description %><\/td>/, ""
      replace_in_file 'app/views/topics/index.html.erb', /<th>Description<\/th>/, ""
    end

    def change_topic_title_to_link
      replace_in_file 'app/views/topics/index.html.erb', /<td><%= topic.title %><\/td>/, "<td><%= link_to topic.title, topic %></td>"
    end

    def remove_topic_index_show_edit_link
      replace_in_file 'app/views/topics/index.html.erb', /<td><%= link_to 'Show', topic %><\/td>/, ""
      replace_in_file 'app/views/topics/index.html.erb', /<td><%= link_to 'Edit', edit_topic_path\(topic\) %><\/td>/, ""
    end

    def change_topic_index_destroy_to_delete
      replace_in_file 'app/views/topics/index.html.erb', /Destroy/, "delete"
    end

  end
end