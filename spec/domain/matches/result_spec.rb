require 'rails_helper'

describe Matches::Result do
  let(:team_a)   { instance_double(Teams::Team, "Team A") }
  let(:team_b)   { instance_double(Teams::Team, "Team B") }
  let(:player_a) { instance_double(Players::Player, "Player A") }
  let(:player_b) { instance_double(Players::Player, "Player B") }

  describe("tie") do
    let(:goals) do
      [
        instance_double(
          Matches::Goal,
          "Team A Goal",
          team: team_a,
          player: player_a),
        instance_double(
          Matches::Goal,
          "Team B Goal",
          team: team_b,
          player: player_b)
      ]
    end

    subject { Matches::Result.new(goals: goals) }

    describe "#winning team" do
      it { expect(subject.winning_team).to be nil }
    end

    describe '#losing team' do
      it { expect(subject.losing_team).to be nil }
    end

    describe '#type' do
      it { expect(subject.type).to eq Matches::App::RESULT_TIE }
    end
  end

  describe("win-lose") do
    let(:goals) do
      [ instance_double(Matches::Goal, team: team_a, player: player_a),
        instance_double(Matches::Goal, team: team_a, player: player_a),
        instance_double(Matches::Goal, team: team_b, player: player_b) ]
     end

    subject{ Matches::Result.new(goals: goals) }

    describe '#winner' do
      it { expect(subject.winning_team).to eq team_a }
    end

    describe '#loser' do
      it { expect(subject.losing_team).to eq team_b }
    end

    it '#type' do
      expect(subject.type).to eq Matches::App::RESULT_WIN_LOSE
    end
  end
end