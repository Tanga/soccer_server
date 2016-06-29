# Fixtures Controller Serves up some Soccer Fixtures
class SeedsController < ApplicationController
  Goal = SoccerHexagon::Fixtures::Goal

  before_filter :initialize_apps

  def new
    # Pitch
    pitch    = @pitches_app.create(name: "My Backyard")

    # Teams
    westside = @teams_app.create(name: "Westside")
    eastside = @teams_app.create(name: "Eastside")

    # Players
    joe      = @players_app.create(name: "Joe", team: westside)
    carlos   = @players_app.create(name: "Carlos", team: eastside)

    match    = @matches_app.create(pitch: pitch, teams: [westside, eastside], datetime: Date.current)

    # Fixture
    fixture  = @fixtures_app.create(match: match, pitch: pitch)

    @matches_app.update(match.id, goals: [
      Goal.new(player: joe, time: 10.minutes.ago),
      Goal.new(player: carlos, time: 11.minutes.ago),
      Goal.new(player: carlos, time: 11.minutes.ago)]
    )

    # Read the fixture from the Repo
    fixture  = @fixtures_app.read(fixture.id)

    # Show it as json (Thanks Rails!)
    render json: {fixture: fixture.as_json(methods: :result)}
  end

  private

  def initialize_apps
    @fixtures_app  = SoccerHexagon::Fixtures::App.new repository: Repositories::Fixture
    @pitches_app   = SoccerHexagon::Pitches::App.new  repository: Repositories::Pitch
    @teams_app     = SoccerHexagon::Teams::App.new    repository: Repositories::Team
    @players_app   = SoccerHexagon::Players::App.new  repository: Repositories::Player
    @matches_app   = SoccerHexagon::Matches::App.new  repository: Repositories::Match
  end
end
