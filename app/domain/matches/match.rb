module Matches
  # Domain Match
  class Match
    attr_accessor :id, :goals, :result, :pitch, :teams
    def initialize(id:, goals:, pitch:, teams:)
      @goals  = goals
      @result = Result.new(goals: goals)
      @id     = id
      @pitch  = pitch
      @teams  = teams
    end
  end
end
