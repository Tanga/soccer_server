Dir[File.dirname(__FILE__) + "/soccer_hexagon/domain/**/*.rb"].each do |file|
  require_relative file
end

class SoccerHexagon
  def initialize repositories=nil
    if repositories
      @repositories = repositories.constants.map{|repo| [repo.to_s.downcase, 0] }.to_h
    else
      @repositories = self.class.constants.map do |c|
        [c.downcase, Object.const_get('SoccerHexagon::' + c.to_s + '::App').new]
      end.to_h
    end
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
    @repositories
  end
end
