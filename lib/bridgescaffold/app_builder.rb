module Bridgescaffold
  class AppBuilder < Rails::AppBuilder

    include Bridgescaffold::Actions
    include Bridgescaffold::LayoutActions

    def remove_routes_comment_and_add_scaffol_route
      replace_in_file 'config/routes.rb', /Rails\.application\.routes\.draw do.*end/m, "Rails.application.routes.draw do\nend"
      route "root 'topics#index'\nresources :topics do\nmember do\npost 'upvote'\nend\nend"
    end

    def add_controller_def_in_topics_file
      add_def_in_file 'app/controllers/topics_controller.rb', "end\ndef upvote\n@topic = Topic.find(params[:id])\n@topic.votes.create\nredirect_to(topics_path)\nend\nprivate"
    end

    def add_template_file
      template 'change_index_for_default_file.html.erb.erb', 'app/views/topics/index.html.erb', :force => true
    end

  end
end