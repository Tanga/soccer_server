module Pitches
  # The Pitches App provides commands for use by clients.  All operations on
  # the domain must be performed through Apps
  class App
    def initialize(repository: Repository)
      @repository = repository
    end

    def create(name:)
      @repository.create(name: name)
    end
  end
end