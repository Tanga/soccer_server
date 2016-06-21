require 'rails_helper'

describe Fixtures::Result do
  subject { described_class.new }

  let(:team1) { double('Team1') }
  let(:team2) { double('Team2') }
  let(:player1) { double('Player', team: team1) }
  let(:player2) { double('Player', team: team2) }
  let(:goal1) { double('Goal', player: player1) }
  let(:goal2) { double('Goal', player: player1) }
  let(:goal3) { double('Goal', player: player2) }
  let(:goals) { [goal1] }

  describe 'attributes' do
    subject do
      described_class.new(goals: goals)
    end

    describe '#goals' do
			it { expect(subject.goals).to eq goals}
		end

    context 'win/lose' do
      let(:goals) { [goal1, goal2, goal3] }
      describe '#winner' do
        it { expect(subject.winner).to eq team1}
      end

      describe '#loser' do
        it { expect(subject.loser).to eq team2}
      end

      describe '#type' do
        it { expect(subject.type).to eq 'win/lose'}
      end
    end

    context 'tie' do
      let(:goals) { [goal1, goal3] }
      describe '#winner' do
        it { expect(subject.winner).to eq nil}
      end

      describe '#loser' do
        it { expect(subject.loser).to eq nil}
      end

      describe '#type' do
        it { expect(subject.type).to eq 'tie'}
      end
    end
  end
end