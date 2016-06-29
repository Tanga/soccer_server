# This is the SQL Pitch Repository.  Inject this
# repo to replace the default in memory adapter if you would like
# to back the domain with a SQL database.

module Repositories
  class Pitch
    def self.create **args
      Pitch.create args
    end
  end
end
