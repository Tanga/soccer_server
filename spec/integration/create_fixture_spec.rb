require 'rails_helper'

module ARRepo::ARModels
  describe 'create a fixture' do
    let(:pitch)   { Pitch.create }
    let(:team_a)  { Team.create }
    let(:team_b)  { Team.create }
    let(:goal)    { Goal.create }

    let(:app) do
      Fixtures::App.new( repository:
        Fixtures::SQLRepository
      )
    end

    subject { app.create(
      pitch: pitch,
      teams: [team_a, team_b],
      season: 2016) }

    it 'returns active record objects' do
      expect(subject.class).to eq Fixture
    end
  end
end
