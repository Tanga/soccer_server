RSpec.shared_examples "the Playground" do |parameter|
  it "Plays Nicely" do
    # Pitch
    pitch = pitches_app.create(name: "College Stadium")

    # Teams
    charleston = teams_app.create(name: "Charleston Battery")
    harrisburg = teams_app.create(name: "Harrisburg City Islanders")

    # Players
    jim = players_app.create(name: 'Jim', team: charleston)
    fred = players_app.create(name: 'Fred', team: charleston)
    tom = players_app.create(name: 'Tom', team: harrisburg)

    # Fixtures
    tomorrow = fixtures_app.create(
      season: 2016,
      pitch:  pitch,
      date:   1.day.from_now,
      teams:  [harrisburg, charleston]
    )

    expect(tomorrow.season).to be_a(Fixtures::Season)

    the_day_after = fixtures_app.create(
      season: 2016,
      pitch: pitch,
      date:  2.days.from_now,
      teams: [harrisburg, charleston]
    )

    # Charleston scores twice, Harrisburg scores once
    match = matches_app.create(
      teams: [harrisburg, charleston],
      pitch: tomorrow.pitch,
      goals: matches_app.build_goals([
        { team: charleston, time: tomorrow.date + 1.minute, player: jim },
        { team: charleston, time: tomorrow.date + 2.minutes, player: fred },
        { team: harrisburg, time: tomorrow.date + 3.minutes, player: tom }
      ])
    )

    # Charleston is the winner
    expect(match.result.winning_team).to eq charleston
    expect(match.result.type).to eq Fixtures::App::RESULT_WIN_LOSE

    # Harrisburg scores once, charleston scores once
    match = matches_app.create(
      teams: [harrisburg, charleston],
      pitch: the_day_after.pitch,
      goals: matches_app.build_goals([
        { team: charleston, time: the_day_after.date + 1.minute, player: jim },
        { team: harrisburg, time: the_day_after.date + 2.minutes, player: tom }
      ])
    )

    # The game is tied
    expect(match.result.type).to eq Fixtures::App::RESULT_TIE
  end
end
