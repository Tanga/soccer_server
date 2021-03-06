module Repositories
  class Matches
    def self.create **args
      ::Match.create args
    end

    def self.update id, attributes
      attributes[:goals] =
      attributes[:goals].map do |goal|
        ::Goal.new(player: goal.player, time: goal.time)
      end
      ::Match.find(id).update(attributes)
    end

    def self.query
      ::Match.all
    end
  end
end
