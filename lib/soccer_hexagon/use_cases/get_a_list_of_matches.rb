class SoccerHexagon
  module UseCases
    class GetAListOfMatches
      def initialize(repositories=Utilities::Repositories.new)
        @repositories = repositories
      end

      def call
        @repositories[:matches].query
      end
    end
  end
end
