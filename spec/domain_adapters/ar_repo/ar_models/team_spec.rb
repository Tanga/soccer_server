require 'rails_helper.rb'
require File.expand_path('spec/domain/teams/team_behavior.rb')

module ARRepo::ARModels
  describe Team do
    let(:name) { "Westside" }
    it_should_behave_like("a Domain Team")
  end
end
