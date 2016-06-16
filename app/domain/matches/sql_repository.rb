module Matches
  class SQLRepository
    def self.create **args
      ARRepo::ARModels::Match.create args
    end
  end
end
