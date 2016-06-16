module Junks
  class SQLRepository
    def self.create **args
      ARRepo::ARModels::Junk.create args
    end
  end
end