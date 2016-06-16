module Players
  # Domain Player
  class Player
    attr_accessor :name, :team, :id

    def initialize name:, team: nil, id:
      @name = name
      @id   = id
      return unless team
      @team = team
    end
  end
end
