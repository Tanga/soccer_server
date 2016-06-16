module Fixtures
  # Use SQL Repository to save changes to a database :)
  class SQLRepository
    def self.create **args
      ARRepo::ARModels::Fixture.create args
    end
  end
end
