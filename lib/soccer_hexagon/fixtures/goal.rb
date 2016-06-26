module SoccerHexagon
  module Fixtures
    class Goal
      attr_accessor :player, :time
      def initialize(player:, time:)
        @player = player
  			@time = time
      end
    end
  end
end
