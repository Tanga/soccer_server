module Fixtures
  # The Fixtures App provides commands for use by clients.  All operations on
  # the domain must be performed through Apps
  class App
    RESULT_TIE      = 'tied'
    RESULT_WIN_LOSE = 'win-lose'
    delegate(:delete, :update, :read, to: :@repository)

    def initialize repository: Fixtures::Repository
      @repository = repository
    end

    def create **args
      fail "A fixture requires two teams" if args[:teams].count != 2
      @repository.create(args)
    end
  end
end
