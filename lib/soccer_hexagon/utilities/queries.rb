class SoccerHexagon
  module Utilities
    # The repository container makes it easy to switch between the default domain
    # repositories or repositories injected from outside.
    #
    # container = RepositoryContainer.new
    # > container[:<repo_name>] # > Object Conforming to Domain::<Module>::Repository
    class Queries
      def initialize(repositories=Utilities::Repositories::Domain.new)
        @repos = repositories.call
      end

      def [](module_name, args={})
        repo = @repos[module_name]
        constant = query_constant(module_name)
        constant.new(repo).call(args)
      end

      private

      def query_constant(module_name)
        Object.const_get("SoccerHexagon::Domain::" + module_name.to_s.camelize + '::Query')
      end
    end
  end
end
