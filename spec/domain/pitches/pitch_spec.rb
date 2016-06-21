require 'rails_helper'
require File.expand_path('spec/domain/pitches/pitch_behavior.rb')

describe Pitches::Pitch do
  subject { described_class.new }

  let(:name) { double('Name') }

  it_should_behave_like("a Domain Pitch")
end
