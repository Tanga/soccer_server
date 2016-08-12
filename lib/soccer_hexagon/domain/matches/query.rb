class SoccerHexagon
  module Domain
    module Matches
      class Query
        def initialize(repository=Repository)
          @repository = repository
        end

        def call(args)
          if args[:id]
            @repository.read args[:id]
          else
            @repository.query
          end
        end
      end
    end
  end
end
