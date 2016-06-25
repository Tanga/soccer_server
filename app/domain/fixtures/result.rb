module Fixtures
  class Result
    attr_accessor :goals, :winner, :loser, :type
    def initialize(goals:)
      @goals = goals
      @winner = nil
      @loser = nil
      @type = "tie"

      return [] if goals.empty?

      team_goals = @goals.group_by{ |goal| goal.player.team }
        .map{|team, goals| [goals.count, team]}.to_h

      if team_goals.count == 1
      else
        team_goals = team_goals.to_a.sort.reverse
        @winner = team_goals.first[1]
        @loser = team_goals.last[1]
        @type = "win/lose"
      end
    end
  end
end
