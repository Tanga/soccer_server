module Junks
  class App
    def initialize(repository: Repository)
      @repository = repository
    end

    def create(**args)
      @repository.create(args)
    end
  end
end
