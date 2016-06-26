require 'rails_helper'

describe SoccerHexagon::Players::App do
  subject { described_class.new }

  let(:team) { double("Team") }
	let(:name) { double("Name") }

  describe '#create' do
    it 'creates a Player' do
      expect(create_player).to be
    end
  end

  describe '#read' do
    it 'should return a Player by id' do
      create_player
      expect(subject.read(1)).to be
    end
  end

  describe '#destroy' do
    it 'should destroy a Player' do
      player = create_player
      subject.delete(1)
      expect(subject.read(1)).to be_nil
    end
  end

  def create_player
    subject.create team: team, name: name
  end
end
