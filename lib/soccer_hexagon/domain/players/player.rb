class SoccerHexagon
  module Domain
    module Players
      # This is the head of the Players Aggregate.  An
      # Aggregate head is generally an Entity and is the only object
      # that is handled by the Repository and operated on by the application.

      class Player
        attr_accessor :id, :team, :name
        def initialize(id:, team:, name:)
          @id = id
          @team = team
    			@name = name
        end
      end
    end
  end
end
