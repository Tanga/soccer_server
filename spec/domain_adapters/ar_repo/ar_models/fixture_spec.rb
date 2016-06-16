require 'rails_helper'
require File.expand_path('spec/domain/fixtures/fixture_behavior.rb')

module ARRepo::ARModels
  describe Fixture do
    let(:pitch) { Pitch.create }
    let(:team)  { Team.create }
    let(:team_b) { Team.create }
    let(:team_c) { Team.create }
    let(:match)  { Match.create }

    let(:goal)  { Goal.create(team: team) }
    let(:new_goal) { Goal.create(team: team_b) }

    it_should_behave_like "a Domain Fixture"
  end
end