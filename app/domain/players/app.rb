module Players
  # The Players App provides commands for use by clients.  All operations on
  # the domain must be performed through Apps
  class App
    delegate :create, to: :@repository

    def initialize(repository: Repository)
      @repository = repository
    end
  end
end
