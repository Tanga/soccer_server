require 'rails_helper'

describe Fixtures::App do
  subject       { described_class.new }
  let(:backyard_pitch)   { double("My Backyard") }
  let(:stadium_pitch)   { double("International Stadium") }
  let(:team_a)  { double("Team A") }
  let(:team_b)  { double("Team B") }

  describe '#create' do
    it 'creates a fixture' do
      create_fixture
    end

    it 'requires two teams' do
      expect { subject.create(pitch: backyard_pitch, teams: [team_a], season: 2016) }
        .to raise_error "A fixture requires two teams"
    end
  end

  describe '#read' do
    it 'should return a fixture by id' do
      create_fixture
      expect(subject.read(1)).to be
    end
  end

  describe '#update' do
    it 'should update a fixture' do
      fixture = create_fixture
      expect(subject.update(1, {pitch: stadium_pitch}).pitch).to eq stadium_pitch
    end
  end

  describe '#destroy' do
    it 'should destroy a fixture' do
      fixture = create_fixture
      subject.delete(1)
      expect(subject.read(1)).to be_nil
    end
  end

  def create_fixture
    subject.create(
      pitch: backyard_pitch,
      teams: [team_a, team_b],
      season: 2016,
      date: Date.today)
  end
end
