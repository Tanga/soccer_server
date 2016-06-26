Dir[File.dirname(__FILE__) + "/soccer_hexagon/domain/**/*.rb"].each do |file|
  require_relative file
end
