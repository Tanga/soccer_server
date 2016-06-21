require 'rails_helper.rb'
require File.expand_path('spec/domain/fixtures/fixture_behavior.rb')

module ARRepo::ARModels
  describe Fixture do
    let(:team) { Team.create}
    let(:teams) { [team] }
    let(:result) { Result.create }
    let(:pitch) { Pitch.create }

    it_should_behave_like("a Domain Fixture")
  end
end
