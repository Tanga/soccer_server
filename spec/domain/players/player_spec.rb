require 'rails_helper'
require File.expand_path('spec/domain/players/player_behavior.rb')

describe Players::Player do
  subject { described_class.new }

  let(:team) { double('Team') }
	let(:name) { double('Name') }

  it_should_behave_like("a Domain Player")
end
