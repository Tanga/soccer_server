require 'rails_helper.rb'
require File.expand_path('spec/domain/pitches/pitch_behavior.rb')

module ARRepo::ARModels
  describe Pitch do
    let(:name) {"My Backyard"}
    it_should_behave_like("a Domain Pitch")
  end
end
