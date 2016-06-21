module Fixtures
  # This is the head of the Fixtures Aggregate.  An
  # Aggregate head is generally an Entity and is the only object
  # that is handled by the Repository and operated on by the application.

  class Fixture
    attr_accessor :id, :teams, :result, :pitch
    def initialize(id:, teams:, result: nil, pitch:)
      @id = id
      @teams = teams
			@result = result
			@pitch = pitch
    end
  end
end
