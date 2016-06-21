module ARRepo
  module ARModels
    class Goal < ActiveRecord::Base
      belongs_to :result
      belongs_to :player
    end
  end
end
