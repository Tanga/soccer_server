module DomainGenerators
  class Aggregate < Thor::Group
    include Thor::Actions

    argument :name
    argument :head_name
    class_option :test_framework, :default => :rspec

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_app
      template('templates/app.tt', "../../app/domain/#{name}/app.rb")
    end

    def create_app_spec_file
      template('templates/spec/app.tt', "../../spec/domain/#{name}/app_spec.rb")
    end

    def create_head
      template('templates/aggregate_head.tt', "../../app/domain/#{name}/#{head_name}.rb")
    end

    def create_head_spec_file
      template('templates/spec/aggregate_head.tt', "../../spec/domain/#{name}/#{head_name}_spec.rb")
    end

    def create_head_behavior_file
      template('templates/spec/head_behavior.tt', "../../spec/domain/#{name}/#{head_name}_behavior.rb")
    end

    def create_repository
      template('templates/repository.tt', "../../app/domain/#{name}/repository.rb")
    end

    def create_repository_spec_file
      template('templates/spec/repository.tt', "../../spec/domain/#{name}/repository_spec.rb")
    end

    def create_sql_repository
      template('templates/sql_repository.tt', "../../app/domain/#{name}/sql_repository.rb")
    end

    def create_sql_repository_spec_file
      template('templates/spec/sql_repository.tt', "../../spec/domain/#{name}/sql_repository_spec.rb")
    end

    def create_active_record_model
      template('templates/active_record_model.tt', "../../app/domain_adapters/ar_repo/ar_models/#{head_name}.rb")

    end

    def create_active_record_model_spec
      template('templates/spec/active_record_model.tt', "../../spec/domain_adapters/ar_repo/ar_models/#{head_name}_spec.rb")
    end

  end
end
