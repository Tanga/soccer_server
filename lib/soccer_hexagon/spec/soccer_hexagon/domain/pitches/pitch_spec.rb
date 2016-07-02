require 'spec_helper'
require_relative 'pitch_behavior.rb'

describe SoccerHexagon::Domain::Pitches::Pitch do
  subject { described_class.new }

  let(:name) { double('Name') }

  it_should_behave_like("a Domain Pitch")
end
