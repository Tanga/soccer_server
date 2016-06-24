RSpec.configure do |config|
  config.after(:each) do
    Fixtures::Repository.delete_all
    Pitches::Repository.delete_all
    Players::Repository.delete_all
    Teams::Repository.delete_all
  end
end
