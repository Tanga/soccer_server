module Teams
  # This is the SQL Teams Repository.  Inject this
  # repo to replace the default in memory adapter if you would like
  # to back the domain with a SQL database.  See notes in
  # Teams::Team::Repository
  # for more details
  class SQLRepository
    def self.create **args
      ARRepo::ARModels::Team.create args
    end
  end
end
