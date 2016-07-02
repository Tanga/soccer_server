Dir[File.dirname(__FILE__) + "/soccer_hexagon/domain/**/*.rb"].each do |file|
  require_relative file
end

require_relative 'soccer_hexagon/repository_container'

class SoccerHexagon
  def initialize repositories=nil
    @repos = RepositoryContainer.new(repositories)
  end

  def get_a_list_of_matches
    repos[:matches].query
  end

  def create_a_match(on:, between:, at_location:)
    pitch = repos[:pitches].read(at_location)
    teams = [between.first, between.last]
    repos[:matches].create(pitch: pitch, teams: teams, datetime: on)
  end

  private

  def repos
    @repos
  end
end
