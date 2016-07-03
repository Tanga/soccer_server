class SoccerHexagon
  module UseCases
    class CreateAMatch
      def initialize(repositories=Utilities::Repositories.new)
        @repositories = repositories
      end

      def call(on:, between:, at_location:)
        pitch = @repositories[:pitches].read(at_location)
        teams = [between.first, between.last]
        @repositories[:matches].create(pitch: pitch, teams: teams, datetime: on)
      end
    end
  end
end
