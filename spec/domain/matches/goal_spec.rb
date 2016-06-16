require 'rails_helper'

describe Matches::Goal do
  subject { described_class.new(time: time, player: player) }
  let(:time)   { Time.current }
  let(:player) { instance_double(Players::Player, team: team)}
  let(:team)   { instance_double(Teams::Team)}

  describe 'attributes' do
    describe("time") do
      it { expect(subject.time).to eq(time) }
    end

    describe("#player") do
      it { expect(subject.player).to eq(player) }
    end

    describe("#team") do
      it { expect(subject.team).to eq(team)}
    end
  end
end