module SoccerHexagon
  module Matches
    # This is the head of the Matches Aggregate.  An
    # Aggregate head is generally an Entity and is the only object
    # that is handled by the Repository and operated on by the application.

    class Match
      attr_accessor :id, :pitch, :teams, :datetime, :goals, :result
      def initialize(id:, pitch:, teams:, datetime:)
        @id = id
        @pitch = pitch
        @teams = teams
        @datetime = datetime
        @goals = []
        @result = Matches::Result.new(goals: @goals)
      end

      def goals= goals
        @goals = goals
        @result = Matches::Result.new(goals: @goals)
      end
    end
  end
end
