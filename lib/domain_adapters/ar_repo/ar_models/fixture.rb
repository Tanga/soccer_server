module ARRepo
  module ARModels
    # An Active Record Fixture.  This
    # model will be used with the SQL Adapter with the intent
    # to provide the exact same interface as the corresponding
    # domain model Fixtures::Fixture
    class Fixture < ActiveRecord::Base
      delegate :result, :teams, to: :match
      belongs_to :pitch
      belongs_to :match
    end
  end
end
