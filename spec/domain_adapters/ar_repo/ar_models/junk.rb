require 'rails_helper.rb'
require File.expand_path('spec/domain/junks/junk_behavior.rb')

describe Junks::Junk do
  it_should_behave_like("a Domain Junk")
end
