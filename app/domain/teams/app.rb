module Teams
  # The Team App provides commands for use by clients.  All operations on
  # the domain must be performed through Apps
  class App
    def initialize(repository: Repository)
      @repository = repository
    end

    def create(args= {})
      args = [args] if args.is_a?(Hash)
      args.map {|team| @repository.create(name: team[:name])}
    end
  end
end