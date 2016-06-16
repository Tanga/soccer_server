module Fixtures
  # Domain Season
  class Season
    attr_accessor :year

    def initialize year:
      @year = year
    end
  end
end
