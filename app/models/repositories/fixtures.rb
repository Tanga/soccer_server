module Repositories
  class Fixtures
    def self.create **args
      ::Fixture.create args
    end

    def self.update id, attributes
      fixture = read(id)
      goals = attributes[:result].goals.map{|goal| ARRepo::ARModels::Goal.new(player: goal.player, time: goal.time)}
      attributes[:result] = ARRepo::ARModels::Result.new(goals: goals)
      fixture.update(attributes)
      fixture
    end

    def self.read id
      ::Fixture.find id
    end
  end
end
