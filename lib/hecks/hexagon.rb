require 'active_support/inflector'

class HecksHexagon < Thor::Group
  include Thor::Actions

  argument :name

  def self.source_root
    File.dirname(__FILE__)
  end

  def create_hexagon_file
    template('templates/hexagon.tt', "lib/#{name}.rb")
  end

  def create_hexagon_folder
    directory('templates/hexagon', "lib/#{name}")
  end
end
