require 'rails_helper'
require File.expand_path('spec/domain/fixtures/fixture_behavior.rb')

describe Fixtures::Fixture do
  subject { described_class.new }

  let(:team) { double('Team') }
	let(:teams) { [team] }
	let(:result) { double('Result') }
	let(:pitch) { double('Pitch') }
  let(:match) { double('Match', result: result) }

  it_should_behave_like("a Domain Fixture")
end
