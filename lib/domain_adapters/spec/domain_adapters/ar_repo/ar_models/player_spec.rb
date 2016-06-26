require 'rails_helper.rb'
require File.expand_path('spec/domain/players/player_behavior.rb')

module ARRepo::ARModels
  describe Player do
    let(:team) { Team.create }
    let(:name) { "Frank" }
    it_should_behave_like("a Domain Player")
  end
end
