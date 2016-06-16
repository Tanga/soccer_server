require 'rails_helper'

module ARRepo::ARModels
  describe 'create a fixture' do
    let(:pitch)   { Pitch.create }
    let(:team_a)  { Team.create }
    let(:team_b)  { Team.create }
    let(:goal)    { Goal.create }
    subject do
      Fixtures::App.new( repository: Fixtures::SQLRepository )
    end

    describe "#create" do
      it 'creates a fixture' do
        expect(subject.create(
          pitch: pitch,
          teams: [team_a, team_b],
          season: 2016).class
        ).to eq Fixture
      end
    end
  end
end
