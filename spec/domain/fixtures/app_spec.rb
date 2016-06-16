require 'rails_helper'

describe Fixtures::App do
  subject       { described_class.new }
  let(:pitch)   { double("Pitch") }
  let(:fixture) { double("Fixture", goals: [], id: 1, teams: []) }
  let(:team_a)  { double("Team A") }
  let(:team_b)  { double("Team B") }

  describe '#create' do
    it 'creates a fixture' do
      subject.create(
        pitch: pitch,
        teams: [team_a, team_b],
        season: 2016,
        date: Date.today)
    end

    it 'requires two teams' do
      expect { subject.create(pitch: pitch, teams: [team_a], season: 2016) }
        .to raise_error "A fixture requires two teams"
    end

  end
end