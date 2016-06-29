require File.expand_path('lib/soccer_hexagon/spec/soccer_hexagon/domain/pitches/pitch_behavior.rb')

describe Pitch do
  let(:name) { "My Backyard" }
  it_should_behave_like("a Domain Pitch")
end
