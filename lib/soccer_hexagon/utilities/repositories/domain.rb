class SoccerHexagon
  module Utilities
    class Repositories
      class Domain
        # Collects all the repositorities in the domain and presents a hash interface
        # DomainRepositories[:<repo_name>]

        def initialize(domain_module=SoccerHexagon::Domain)
          @domain_module = domain_module
        end

        def call
          @domain_module.constants.map do |c|
            [c.downcase, repository_constant(c.to_s)]
          end.to_h
        end

        private

        def repository_constant(module_name)
          Object.const_get("SoccerHexagon::Domain::" + module_name + '::Repository')
        end
      end
    end
  end
end
