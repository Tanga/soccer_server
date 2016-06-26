module ARRepo
  module ARModels
    # An Active Record Player.  This
    # model will be used with the SQL Adapter with the intent
    # to provide the exact same interface as the corresponding
    # domain model Players::Player
    class Player < ActiveRecord::Base
      belongs_to :team
    end
  end
end
