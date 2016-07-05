class SoccerHexagon
  module Utilities
    # The repository container makes it easy to switch between the default domain
    # repositories or repositories injected from outside.
    #
    # container = RepositoryContainer.new
    # > container[:<repo_name>] # > Object Conforming to Domain::<Module>::Repository
    class Repositories
      def initialize(repositories=Utilities::Repositories::Domain.new)
        @repos = repositories.call
      end

      def all
        @repos.values
      end

      def [](repo_name)
        @repos[repo_name]
      end
    end
  end
end
