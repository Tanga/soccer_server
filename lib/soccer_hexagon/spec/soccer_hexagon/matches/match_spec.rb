require 'rails_helper'
require_relative 'match_behavior.rb'

describe SoccerHexagon::Matches::Match do
  subject { described_class.new }

  let(:pitch) { double('Pitch') }
	let(:team) { double('Team') }
	let(:teams) { [team] }
	let(:datetime) { double('Datetime') }
  let(:goal) { double('Goal', player: player) }
  let(:player) { double('Player', team: team) }
  let(:goals) { [goal] }

  it_should_behave_like("a Domain Match")
end
