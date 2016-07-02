RSpec.configure do |config|
  config.after(:each) do
    [ SoccerHexagon::Domain::Fixtures::Repository,
      SoccerHexagon::Domain::Pitches::Repository,
      SoccerHexagon::Domain::Players::Repository,
      SoccerHexagon::Domain::Teams::Repository,
      SoccerHexagon::Domain::Matches::Repository ]
    .each {|repo| repo.delete_all }
  end
end
