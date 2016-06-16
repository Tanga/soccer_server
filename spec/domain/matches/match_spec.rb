require 'rails_helper'
require File.expand_path('spec/domain/matches/match_behavior.rb')

describe Matches::Match do
  subject { described_class.new }
  let(:teama) { double("Team A") }
  let(:teamb) { double("Team B") }
  let(:goal)  { double("Goal", team: teama)}
  let(:pitch) { double("Pitch")}

  it_should_behave_like("a Domain Match")
end