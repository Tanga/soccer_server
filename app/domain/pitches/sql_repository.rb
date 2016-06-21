module Pitches
  # This is the SQL Pitches Repository.  Inject this
  # repo to replace the default in memory adapter if you would like
  # to back the domain with a SQL database.  See notes in
  # Pitches::Pitch::Repository
  # for more details
  class SQLRepository
    def self.create **args
      ARRepo::ARModels::Pitch.create args
    end
  end
end
