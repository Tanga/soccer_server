module SoccerHexagon
  module Fixtures
    # This is an app that clients will be required to interact
    # with to perform operations on the Fixtures Aggregate

    class App
      delegate :create, :read, :update, :delete, to: :@repository
      def initialize(repository: Repository)
        @repository = repository
      end
    end
  end
end
