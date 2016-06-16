require 'rails_helper'
require File.expand_path('spec/integration/playground_behavior.rb')

describe "SQL" do
  let(:pitches_app)  { Pitches::App.new  repository: Pitches::SQLRepository }
  let(:players_app)  { Players::App.new  repository: Players::SQLRepository }
  let(:teams_app)    { Teams::App.new    repository: Teams::SQLRepository }
  let(:matches_app)  { Matches::App.new  repository: Matches::SQLRepository }
  let(:fixtures_app) { Fixtures::App.new repository: Fixtures::SQLRepository }

  it_should_behave_like("the Playground")
end