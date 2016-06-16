module Matches
  # The Matches App provides commands for use by clients.  All operations on
  # the domain must be performed through Apps
  class App
    RESULT_TIE      = 'tied'
    RESULT_WIN_LOSE = 'win-lose'

    def initialize(repository: Repository)
      @repository = repository
    end

    def create(**args)
      @repository.create(args)
    end

    def build_goal(goal)
      Goal.new(time: goal[:time], player: goal[:player])
    end

    def build_goals(goals)
      goals.map do |goal|
        build_goal(goal)
      end
    end
  end
end
