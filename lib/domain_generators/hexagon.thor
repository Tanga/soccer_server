require 'active_support/inflector'
module DomainGenerators
  class Hexagon < Thor::Group
    # include ActiveSupport::Inflector
    include Thor::Actions

    argument :name

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_hexagon_file
      template('templates/hexagon.tt', "../#{name}.rb")
    end

    def create_hexagon_folder
      directory('templates/hexagon', "../#{name}")
    end
  end
end
