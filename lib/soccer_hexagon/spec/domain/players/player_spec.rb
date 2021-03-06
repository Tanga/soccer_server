require 'spec_helper'
require_relative 'player_behavior.rb'

describe SoccerHexagon::Domain::Players::Player do
  subject { described_class.new }

  let(:team) { double('Team') }
	let(:name) { double('Name') }

  it_should_behave_like("a Domain Player")
end
