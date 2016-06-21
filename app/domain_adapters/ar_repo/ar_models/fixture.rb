module ARRepo
  module ARModels
    # An Active Record Fixture.  This
    # model will be used with the SQL Adapter with the intent
    # to provide the exact same interface as the corresponding
    # domain model Fixtures::Fixture
    class Fixture < ActiveRecord::Base
      has_and_belongs_to_many :teams
      belongs_to :pitch
      belongs_to :result

      def result
        Fixtures::Result.new(goals: Result.find(self[:result_id]).goals)
      end
    end
  end
end
