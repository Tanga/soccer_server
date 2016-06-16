require 'rails_helper'
require File.expand_path('spec/domain/junks/junk_behavior.rb')

describe Junks::Junk do
  subject { described_class.new }

  it_should_behave_like("a Domain Junk")
end