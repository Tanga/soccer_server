module ARRepo
  module ARModels
    # An Active Record Player.  This
    # model will be used with the SQL Adapter with the intent
    # to provide the exact same interface as the corresponding
    # domain model Players::Player
    class Result < ActiveRecord::Base
      has_many :goals
    end
  end
end
