module Matches
  # This is the SQL Matches Repository.  Inject this
  # repo to replace the default in memory adapter if you would like
  # to back the domain with a SQL database.  See notes in
  # Matches::Match::Repository
  # for more details
  class SQLRepository
    def self.create **args
      ARRepo::ARModels::Match.create args
    end
  end
end
