module Repositories
  class Teams
    def self.create **args
      ::Team.create args
    end
  end
end
