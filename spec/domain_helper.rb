RSpec.configure do |config|
  config.after(:each) do
    [ Fixtures::Repository,
      Pitches::Repository,
      Players::Repository,
      Teams::Repository,
      Matches::Repository ]
    .each {|repo| repo.delete_all }
  end
end
