require 'spec_helper'
require_relative 'fixture_behavior.rb'

describe SoccerHexagon::Domain::Fixtures::Fixture do
  subject { described_class.new }

	let(:result) { double('Result') }
	let(:pitch) { double('Pitch') }
  let(:team) { double('Team') }
  let(:match) { double('Match', result: result, teams: [team]) }

  it_should_behave_like("a Domain Fixture")
end
