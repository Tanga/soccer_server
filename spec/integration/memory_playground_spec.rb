require 'rails_helper'
require File.expand_path('spec/integration/playground_behavior.rb')

describe "Memory" do
  let(:pitches_app)  { Pitches::App.new  }
  let(:players_app)  { Players::App.new  }
  let(:teams_app)    { Teams::App.new    }
  let(:matches_app)  { Matches::App.new  }
  let(:fixtures_app) { Fixtures::App.new }

  it_should_behave_like("the Playground")
end

