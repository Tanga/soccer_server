# Fixtures Controller Serves up some Soccer Fixtures
class SeedsController < ApplicationController
  before_filter :initialize_apps

  def initialize_apps
    @fixtures_app  = Fixtures::App.new #repository: Fixtures::SQLRepository
    @pitches_app   = Pitches::App.new  #repository: Pitches::SQLRepository
    @teams_app     = Teams::App.new    #repository: Teams::SQLRepository
    @players_app   = Players::App.new  #repository: Players::SQLRepository
  end

  def new
    pitch    = @pitches_app.create(name: "My Backyard")
    westside = @teams_app.create(name: "Westside")
    eastside = @teams_app.create(name: "Eastside")
    joe      = @players_app.create(name: "Joe", team: westside)
    carlos   = @players_app.create(name: "Carlos", team: eastside)
    fixture  = @fixtures_app.create(teams: [eastside, westside], pitch: pitch)
    goal1    = Fixtures::Goal.new(player: joe, time: 10.minutes.ago)
    goal2    = Fixtures::Goal.new(player: carlos, time: 11.minutes.ago)
    goal3    = Fixtures::Goal.new(player: carlos, time: 11.minutes.ago)
    result   = Fixtures::Result.new(goals: [goal1, goal2, goal3])
    @fixtures_app.update(fixture.id, result: result)
    fixture  = @fixtures_app.read(fixture.id)

    render json: {fixture: fixture}
  end
end
