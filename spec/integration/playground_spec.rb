require 'rails_helper'

describe 'Playground' do
  it do
    pitch = Pitches::App.new.create(name: "My Backyard")
    westside = Teams::App.new.create(name: "Westside")
    eastside = Teams::App.new.create(name: "Eastside")
    joe = Players::App.new.create(name: "Joe", team: westside)
    carlos = Players::App.new.create(name: "Carlos", team: eastside)
    fixture = Fixtures::App.new.create(teams: [eastside, westside], pitch: pitch)

    goal1 = Fixtures::Goal.new(player: joe, time: 10.minutes.ago)
    goal2 = Fixtures::Goal.new(player: carlos, time: 11.minutes.ago)

    result = Fixtures::Result.new(goals: [goal1, goal2])

    Fixtures::App.new.update(fixture.id, result: result)

    fixture = Fixtures::App.new.read(fixture.id)
    expect(fixture.result.type).to eq 'tie'
  end
end
