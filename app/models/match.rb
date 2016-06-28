# An Active Record Match.  This
# model will be used with the SQL Adapter with the intent
# to provide the exact same interface as the corresponding
# domain model Matches::Match
class Match < ActiveRecord::Base
  belongs_to :result
  has_and_belongs_to_many :teams
end
