
require 'active_support/inflector'
file_path = File.dirname(__FILE__)

[ file_path + "/soccer_hexagon/domain/**/*.rb",
  file_path + "/soccer_hexagon/utilities/**/*.rb",
  file_path + "/soccer_hexagon/use_cases/**/*.rb"]
  .each { |path| Dir[path].each { |file| require_relative file } }

# Convenience class for calling use cases.  The #[] method will look up any
# usecase and run it by passing args and a repositories container.
#
# SoccerHexagon.new[:some_use_case, arg1: arg1, arg2: arg:2]
#
# You can pass in repositories using the initializer if you want to use
# something other than the default domain repos
class SoccerHexagon
  def initialize container: Utilities::Repositories.new
    @repos = container
  end

  def [](use_case_name, *args)
    use_case_constant(use_case_name).new(@repos).call(*args)
  end

  private

  def use_case_constant(name)
    self.class.const_get "UseCases::#{name.to_s.camelize}"
  end
end
