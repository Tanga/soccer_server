RSpec.configure do |config|
  config.after(:each) do
    [ SoccerHexagon::Fixtures::Repository,
      SoccerHexagon::Pitches::Repository,
      SoccerHexagon::Players::Repository,
      SoccerHexagon::Teams::Repository,
      SoccerHexagon::Matches::Repository ]
    .each {|repo| repo.delete_all }
  end
end
