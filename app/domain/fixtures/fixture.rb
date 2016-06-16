module Fixtures
  # Domain Fixture
  class Fixture
    attr_accessor :id, :pitch, :teams, :goals, :season, :date, :match

    def initialize id:, pitch:, teams:, season:, date:, match: nil
      @id     = id
      @pitch  = pitch
      @teams  = teams
      @season = season
      @date   = date
      @match  = match
    end

    def season
      Season.new year: @season
    end
  end
end
