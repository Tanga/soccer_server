module ARRepo
  module ARModels
    # An Active Record Player
    class Player < ActiveRecord::Base
      belongs_to :team
    end
  end
end