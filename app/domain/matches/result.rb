module Matches
  # Domain Result
  class Result
    attr_accessor :winning_team, :losing_team, :type

    def initialize goals:
      @goals = goals
      @type = tie? ? App::RESULT_TIE : App::RESULT_WIN_LOSE

      @winning_team = nil
      @losing_team = nil

      return if tie?
      @winning_team = team_goal_counts.first
      @losing_team  = team_goal_counts.last
    end

    private

    def tie?
      team_goals.keys.count == 1
    end

    def team_goals
      @goals.group_by(&:team).map do |team, goals|
        [goals.count, team]
      end.to_h
    end

    def team_goal_counts
      team_goals.sort.reverse.map{|a| a[1]}
    end
  end
end
