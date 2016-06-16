require 'rails_helper.rb'
require File.expand_path('spec/domain/fixtures/fixture_behavior.rb')

describe Fixtures::Fixture do
  let(:pitch)    { double('Pitch', attributes: {}) }
  let(:team)     { double('Team', attributes: {})}
  let(:goal)     { double('Goal', team: team, attributes: {})}
  let(:new_goal) { double('New Goal', team: team_b) }
  let(:team_b)   { double("Team B") }
  let(:team_c)   { double("Team C") }
  let(:match)    { double("Match") }

  it_should_behave_like("a Domain Fixture")
end