# Fixtures Controller Serves up some Soccer Fixtures
class SeedsController < ApplicationController
  before_filter :initialize_apps

  def initialize_apps
    @fixtures_app  = Fixtures::App.new repository: Fixtures::SQLRepository
    @pitches_app   = Pitches::App.new  repository: Pitches::SQLRepository
    @teams_app     = Teams::App.new    repository: Teams::SQLRepository
    @players_app   = Players::App.new  repository: Players::SQLRepository
  end

  def new
    # Pitch
    pitch    = @pitches_app.create(name: "My Backyard")

    # Teams
    westside = @teams_app.create(name: "Westside")
    eastside = @teams_app.create(name: "Eastside")

    # Players
    joe      = @players_app.create(name: "Joe", team: westside)
    carlos   = @players_app.create(name: "Carlos", team: eastside)

    # Fixture
    fixture  = @fixtures_app.create(teams: [eastside, westside], pitch: pitch)

    # Goals
    goal1    = Fixtures::Goal.new(player: joe, time: 10.minutes.ago)
    goal2    = Fixtures::Goal.new(player: carlos, time: 11.minutes.ago)
    goal3    = Fixtures::Goal.new(player: carlos, time: 11.minutes.ago)

    # Result
    result   = Matches::Result.new(goals: [goal1, goal2, goal3])

    # Add the Result to the Fixture
    @fixtures_app.update(fixture.id, result: result)

    # Read the fixture from the Repo
    fixture  = @fixtures_app.read(fixture.id)

    # Show it as json (Thanks Rails!)
    render json: {fixture: fixture.as_json(methods: :result)}
  end
end
