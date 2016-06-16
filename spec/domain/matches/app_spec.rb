require 'rails_helper'

describe Matches::App do
  let(:goal)    { double("Goal", team: team_a) }
  let(:team_a)  { double("Team A") }
  let(:team_b)  { double("Team B") }
  let(:player)  { double("Player", team: team_a)}
  let(:fixture) { double("Fixture") }
  let(:pitch)   { double("Pitch") }


  subject { described_class.new }
  describe '#create' do
    it 'creates a match' do
      subject.create(
        teams: [team_a, team_b],
        pitch: pitch,
        goals: subject.build_goals(
          [
            {
              team: team_b,
              time: Time.current,
              player: player
            }
          ]
        )
      )
    end
  end

  describe '#build_goal' do
    it 'builds a goal' do
      expect(subject.build_goal(
        team: team_a,
        time: Time.current,
        player: player).class)
      .to eq Matches::Goal
    end
  end

  describe '#build_goals' do
    it 'builds several goals' do
      expect(
        subject.build_goals([{
          team: team_a,
          time: Time.current,
          player: player}]).class
      ).to eq Array
    end
  end


end