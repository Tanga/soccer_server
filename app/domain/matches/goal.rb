module Matches
  # Domain Goal
  class Goal
    attr_accessor :time, :player, :team
    def initialize time:, player:
      @time   = time
      @player = player
      @team   = player.team
    end
  end
end
