module Repositories
  class Players
    def self.create **args
      ::Player.create args
    end
  end
end
