module ARRepo
  module ARModels
    # An Active Record Fixture
    class Fixture < ActiveRecord::Base
      belongs_to              :pitch
      has_and_belongs_to_many :teams
      belongs_to              :match

      default_scope { includes(:teams) }

      def season
        Fixtures::Season.new(year: self[:season])
      end
    end
  end
end