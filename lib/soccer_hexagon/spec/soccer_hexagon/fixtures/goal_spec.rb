require 'rails_helper'

describe SoccerHexagon::Fixtures::Goal do
  subject { described_class.new }

  let(:player) { double('Player') }
	let(:time) { double('Time') }

  describe 'attributes' do
    subject do
      described_class.new(player: player, time: time )
    end

    		describe '#player' do
			it { expect(subject.player).to eq player}
		end
		describe '#time' do
			it { expect(subject.time).to eq time}
		end
  end
end
