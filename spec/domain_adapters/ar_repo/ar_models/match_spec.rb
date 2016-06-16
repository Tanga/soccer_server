require 'rails_helper'
require File.expand_path('spec/domain/matches/match_behavior.rb')

module ARRepo::ARModels
  describe Match do
    let(:teama) { Team.create }
    let(:teamb) { Team.create }
    let(:goal)  { Goal.create }
    let(:pitch) { Pitch.create }

    it_should_behave_like "a Domain Match"
  end
end