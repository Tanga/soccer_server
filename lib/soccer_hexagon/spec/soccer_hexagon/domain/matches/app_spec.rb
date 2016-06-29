require 'spec_helper'

describe SoccerHexagon::Matches::App do
  subject { described_class.new }

  let(:pitch) { double("Pitch") }
	let(:teams) { double("Teams") }
	let(:datetime) { double("Datetime") }

  describe '#create' do
    it 'creates a Match' do
      expect(create_match).to be
    end
  end

  describe '#read' do
    it 'should return a Match by id' do
      create_match
      expect(subject.read(1)).to be
    end
  end

  describe '#destroy' do
    it 'should destroy a Match' do
      match = create_match
      subject.delete(1)
      expect(subject.read(1)).to be_nil
    end
  end

  def create_match
    subject.create pitch: pitch, teams: teams, datetime: datetime
  end
end
