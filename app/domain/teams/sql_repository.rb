module Teams
  class SQLRepository
    def self.create **args
      ARRepo::ARModels::Team.create args
    end
  end
end