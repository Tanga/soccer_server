require 'rails_helper'
require File.expand_path('spec/domain/teams/team_behavior.rb')

describe Teams::Team do
  subject { described_class.new }

  let(:name) { double('Name') }

  it_should_behave_like("a Domain Team")
end
