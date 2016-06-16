module ARRepo
  module ARModels
    # An Active Record Goal
    class Goal < ActiveRecord::Base
      belongs_to :team
      belongs_to :player
    end
  end
end