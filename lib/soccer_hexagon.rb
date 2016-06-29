Dir[File.dirname(__FILE__) + "/soccer_hexagon/domain/**/*.rb"].each do |file|
  require_relative file

  module SoccerHexagon
    def self.repositories(repositories)
      @fixtures = repositories::Fixture
      @matches = Matches::App.new(repository: repositories::Match)
      @pitches = Pitches::App.new(repository: repositories::Pitch)
    end

    def self.get_a_list_of_matches
      @matches.query
    end

    def self.create_a_match(on:, between:, at_location:)
      pitch = @pitches.read(at_location)
      teams = [between.first, between.last]
      @matches.create(pitch: pitch, teams: teams, datetime: on)
    end
  end
end
