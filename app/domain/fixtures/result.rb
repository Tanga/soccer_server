module Fixtures
  class Result
    attr_accessor :goals, :winner, :type
    def initialize(goals:)
      @goals = goals
      @winner = nil
      @type = "tie"

      return [] if goals.empty?

      team_goals = @goals.group_by{ |goal| goal.player.team }
        .map{|team, goals| [goals.count, team]}.to_h

      if team_goals.count == 1
      else
        team_goals = team_goals.to_a.sort.reverse
        @winner = team_goals.first[1]
        @type = "win/lose"
      end
    end
  end
end
