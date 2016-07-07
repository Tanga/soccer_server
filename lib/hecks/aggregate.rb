  class HecksAggregate < Thor::Group
    include Thor::Actions

    argument :hexagon_name, type: :string
    argument :module_name
    argument :head_name
    argument :attributes, type: :hash

    class_option :test_framework, :default => :rspec

    def self.source_root
      File.dirname(__FILE__)
    end

    def domain_path
      "lib/#{hexagon_name}/domain"
    end

    def spec_path
      "lib/#{hexagon_name}/spec/domain"
    end

    def create_head
      template('templates/aggregate_head.tt', "#{domain_path}/#{name}/#{head_name}.rb")
    end

    def create_head_spec_file
      template('templates/spec/aggregate_head.tt', "#{spec_path}/#{name}/#{head_name}_spec.rb")
    end

    def create_head_behavior_file
      template('templates/spec/head_behavior.tt', "#{spec_path}/#{name}/#{head_name}_behavior.rb")
    end

    def create_repository
      template('templates/repository.tt', "#{domain_path}/#{name}/repository.rb")
    end

    def create_repository_spec_file
      template('templates/spec/repository.tt', "#{spec_path}/#{name}/repository_spec.rb")
    end
  end
