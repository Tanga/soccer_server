require 'pry'
module DomainGenerators
  class ValueObject < Thor::Group
    include Thor::Actions

    argument :module_name
    argument :name
    argument :attributes, type: :hash

    class_option :test_framework, :default => :rspec

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_value_object
      template('templates/value_object.tt', "../../app/domain/#{module_name}/#{name}.rb")
    end

    def create_app_spec_file
      template('templates/spec/value_object.tt', "../../spec/domain/#{module_name}/#{name}_spec.rb")
    end
  end
end
