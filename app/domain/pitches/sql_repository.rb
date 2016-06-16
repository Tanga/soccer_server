module Pitches
  # SQL Rpository Adapter for pitches
  class SQLRepository
    def self.create **args
      ARRepo::ARModels::Pitch.create args
    end
  end
end
