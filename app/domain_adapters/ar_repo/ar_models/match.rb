module ARRepo
  module ARModels
    # An Active Record Match.  This
    # model will be used with the SQL Adapter with the intent
    # to provide the exact same interface as the corresponding
    # domain model Matches::Match
    class Match < ActiveRecord::Base
    end
  end
end
