module ARRepo
  module ARModels
    # An Active Record Match
    class Match < ActiveRecord::Base
      has_many :goals
      belongs_to :pitch
      has_and_belongs_to_many :teams

      def result
        Matches::Result.new(goals: goals)
      end

      def self.create(**args)
        super args.merge({goals: map_goals(args[:goals])})
      end

      def self.map_goals(goals)
        return [] unless goals
        goals.map do |goal|
          Goal.new(
            time: goal.time,
            player_id: goal.player.id,
            team_id: goal.team.id)
        end
      end
    end
  end
end