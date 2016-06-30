class SoccerHexagon
  module Fixtures
    # This is the head of the Fixtures Aggregate.  An
    # Aggregate head is generally an Entity and is the only object
    # that is handled by the Repository and operated on by the application.

    class Fixture
      attr_accessor :id, :teams, :pitch, :match

      def initialize(id:, pitch:, match:)
        @id = id
  			@pitch = pitch
        @match = match
      end

      def result
        @match.result
      end

      def teams
        @match.teams
      end
    end
  end
end
