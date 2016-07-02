class SoccerHexagon
  module Domain
    module Fixtures
      # This is an app that clients will be required to interact
      # with to perform operations on the Fixtures Aggregate

      class App
        def initialize(repository: Repository)
          @repository = repository
        end

        def create(args)
          @repository.create(args)
        end

        def update(id, attributes)
          @repository.update(id, attributes)
        end

        def read(id)
          @repository.read(id)
        end

        def delete(id)
          @repository.delete(id)
        end
      end
    end
  end
end
