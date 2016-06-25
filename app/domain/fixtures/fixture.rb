module Fixtures
  # This is the head of the Fixtures Aggregate.  An
  # Aggregate head is generally an Entity and is the only object
  # that is handled by the Repository and operated on by the application.

  class Fixture
    attr_accessor :id, :teams, :pitch, :match
    delegate :result, to: :@match

    def initialize(id:, teams:, pitch:, match:)
      @id = id
      @teams = teams
			@pitch = pitch
      @match = match
    end
  end
end
