require 'rails_helper'
require File.expand_path('spec/domain/matches/match_behavior.rb')

describe Matches::Match do
  subject { described_class.new }

  let(:pitch) { double('Pitch') }
	let(:team) { double('Team') }
	let(:teams) { [team] }
	let(:datetime) { double('Datetime') }
  let(:goal) { double('Goal') }
  let(:goals) { [goal] }

  it_should_behave_like("a Domain Match")
end
