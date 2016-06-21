module Fixtures
  # This is the SQL Fixtures Repository.  Inject this
  # repo to replace the default in memory adapter if you would like
  # to back the domain with a SQL database.  See notes in
  # Fixtures::Fixture::Repository
  # for more details
  class SQLRepository
    def self.create **args
      ARRepo::ARModels::Fixture.create args
    end
  end
end
