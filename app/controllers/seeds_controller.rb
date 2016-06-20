# Fixtures Controller Serves up some Soccer Fixtures
class SeedsController < ApplicationController
  before_filter :initialize_apps

  def initialize_apps
    @fixtures_app  = Fixtures::App.new #repository: Fixtures::SQLRepository
    @pitches_app   = Pitches::App.new  #repository: Pitches::SQLRepository
    @teams_app     = Teams::App.new    #repository: Teams::SQLRepository
    @players_app   = Players::App.new  #repository: Players::SQLRepository
    @matches_app   = Matches::App.new  #repository: Matches::SQLRepository
  end

  def new
    pitch      = @pitches_app.create(name: "My backyard")
    harrison   = @teams_app.create(name: "Harrison")
    charleston = @teams_app.create(name: "Charleston")

    chris      = @players_app.create(name: 'Chris', team: harrison)
    carlos     = @players_app.create(name: 'Carlos', team: charleston)

    match = @matches_app.create(
      teams: [harrison, charleston],
      pitch: pitch,
      goals: @matches_app.build_goals([
        { team: charleston, time: 1.minute.from_now, player: chris },
        { team: charleston, time: 2.minutes.from_now, player: carlos }
      ])
    )

    fixture = @fixtures_app.create(
      season: 2016,
      date: Date.today,
      match: match,
      pitch: pitch,
      teams: [harrison, charleston]
    )

    render json: {fixture: fixture}
  end
end
