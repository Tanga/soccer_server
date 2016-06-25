require 'rails_helper'

describe 'Playground' do
  it 'plays a soccer match' do
    # PITCH
    pitch    = Pitches::App.new.create(name: "My Backyard")

    # TEAMS
    westside = Teams::App.new.create(name: "Westside")
    eastside = Teams::App.new.create(name: "Eastside")

    # PLAYERS
    joe      = Players::App.new.create(name: "Joe", team: westside)
    carlos   = Players::App.new.create(name: "Carlos", team: eastside)

    # MATCH
    match = Matches::App.new.create(
      pitch: pitch,
      teams: [eastside, westside],
      datetime: Date.current
    )

    # SCHEDULE
    fixture  = Fixtures::App.new.create(
      teams: [eastside, westside],
      pitch: pitch,
      match: match
    )

    # PLAY THE MATCH
    Matches::App.new.update(match.id, goals: [
      Fixtures::Goal.new(
        player: joe,
        time: 10.minutes.ago),
      Fixtures::Goal.new(
        player: carlos,
        time: 10.minutes.ago)
      ]
    )

    # CHECK THE RESULT
    match = Matches::App.new.read(match.id)
    fixture = Fixtures::App.new.read(fixture.id)

    expect(match.result.type).to eq 'tie'
    expect(fixture.result).to eq match.result
  end
end
