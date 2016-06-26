require 'spec_helper'
require_relative 'team_behavior.rb'

describe SoccerHexagon::Teams::Team do
  subject { described_class.new }

  let(:name) { double('Name') }

  it_should_behave_like("a Domain Team")
end
