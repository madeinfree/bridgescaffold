require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Bridgescaffold
  class AppGenerator < Rails::Generators::AppGenerator

    def finish_template
      super
    end

    def setup_scaffold
      build :generate_scaffold
      invoke :change_scaffold_default_route
    end

    def change_scaffold_default_route
      invoke :remove_routes_comment_and_add_scaffol_route
    end


    def setup_migrate
      build :database_migrate
    end

    def remove_routes_comment_and_add_scaffol_route
      build :remove_routes_comment_and_add_scaffol_route
    end

    def setup_votes
      build :generator_vote_model
    end

    def add_topic_vote_association
      build :add_topic_association
      build :add_vote_association
    end

    def add_controller_def_in_topics_file
      build :add_controller_def_in_topics_file
    end

    def add_template_file
      build :add_template_file
    end

    def change_controller_topic_create_update_path
      build :change_controller_topic_create_update_path
    end

    def add_flash_in_index
      build :add_flash_in_index
    end

    def remove_somthing_description
      build :remove_somthing_description
    end

    def change_topic_title_to_link
      build :change_topic_title_to_link
    end

    def remove_topic_index_show_edit_link
      build :remove_topic_index_show_edit_link
    end

    def change_topic_index_destroy_to_delete
      build :change_topic_index_destroy_to_delete
    end

    def get_builder_class
      Bridgescaffold::AppBuilder
    end

  end
end