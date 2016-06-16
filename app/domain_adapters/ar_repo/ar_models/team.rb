module ARRepo
  module ARModels
    # An Active Record Team
    class Team < ActiveRecord::Base
      has_and_belongs_to_many :fixtures
    end
  end
end