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

    def self.update id, attributes
      fixture = read(id)
      goals = attributes[:result].goals.map{|goal| ARRepo::ARModels::Goal.new(player: goal.player, time: goal.time)}
      attributes[:result] = ARRepo::ARModels::Result.new(goals: goals)
      fixture.update(attributes)
      fixture
    end

    def self.read id
      ARRepo::ARModels::Fixture.find id
    end
  end
end
