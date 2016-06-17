module Matches
  # Domain Result
  class Result
    attr_accessor :winning_team, :losing_team, :type

    def initialize goals:
      @goals        = goals
      @type         = determine_result_type
      @winning_team = nil
      @losing_team  = nil

      return if tie?
      @winning_team = team_goal_counts.first
      @losing_team  = team_goal_counts.last
    end

    private

    def determine_result_type
      return App::RESULT_TIE if tie?
      App::RESULT_WIN_LOSE
    end

    def tie?
      team_goals.keys.count == 1
    end

    def team_goals
      @goals.group_by(&:team).map { |team, goals| [goals.count, team] }.to_h
    end

    def team_goal_counts
      team_goals.sort.reverse.map{|count, team| team}
    end
  end
end
