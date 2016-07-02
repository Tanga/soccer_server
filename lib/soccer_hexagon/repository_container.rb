require 'pry'
class SoccerHexagon
  class RepositoryContainer
    def initialize(repositories)
      @repositories = repositories
    end

    def [](name)
      repos[name]
    end

    private

    def repos
      return injected_repositories if @repositories
      default_repositories
    end

    def default_repositories
      SoccerHexagon::Domain.constants.map do |c|
        [c.downcase, Object.const_get("SoccerHexagon::Domain::" + c.to_s + '::Repository')]
      end.to_h
    end

    def injected_repositories
      @repositories.constants.map do |repo|
        [repo.to_s.downcase, repo]
      end.to_h
    end
  end
end
