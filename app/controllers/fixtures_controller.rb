# Fixtures Controller Serves up some Soccer Fixtures
class FixturesController < ApplicationController
  def new
    pitch = @pitches_app.create(name: "My backyard")

    harrison, charleston =
      @teams_app.create([
        { name: "Harrison" },
        { name: "Charleston" }
      ])

    chris, carlos =
      @players_app.create([
        { name: 'Chris', team: harrison },
        { name: 'Carlos', team: charleston }
      ])

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
