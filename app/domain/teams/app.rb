module Teams
  # The Team App provides commands for use by clients.  All operations on
  # the domain must be performed through Apps
  class App
    def initialize(repository: Repository)
      @repository = repository
    end

    def create(**args)
      @repository.create(**args)
    end
  end
end
