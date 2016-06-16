module Players
  class SQLRepository
    def self.create **args
      ARRepo::ARModels::Player.create args
    end
  end
end