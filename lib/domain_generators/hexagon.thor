module DomainGenerators
  class Hexagon < Thor::Group
    include Thor::Actions

    argument :name

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_hexagon_folder
      directory("../../app/domain", "../#{name}")
    end
  end
end
