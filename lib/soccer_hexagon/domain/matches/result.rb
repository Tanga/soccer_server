class SoccerHexagon
  module Domain
    module Matches
      class Result
        attr_accessor :goals, :winner, :type
        def initialize(goals:)
          @goals = goals
          configure_as_tie && return if goals.empty?
          configure_as_win_lose && return if goals.count == 1
          configure_as_win_lose && return if goals.map{|goal| goal.player.team }.uniq.count == 1
          configure_as_tie && return if team_goals.count == 1
          configure_as_win_lose
        end

        def == other
          other.goals == goals
        end

        private

        def configure_as_win_lose
          @winner = sorted_team_goals.first[1]
          @type = "win/lose"
        end

        def configure_as_tie
          @winner = nil
          @type = "tie"
        end

        def team_goals
          @goals.group_by{ |goal| goal.player.team }
            .map{|team, goals| [goals.count, team]}.to_h
        end

        def sorted_team_goals
          team_goals.to_a.sort.reverse
        end
      end
    end
  end
end
