require 'rails_helper'

describe Matches::Result do
  subject { described_class.new }

  let(:team1) { double('Team1') }
  let(:team2) { double('Team2') }
  let(:player1) { double('Player', team: team1) }
  let(:player2) { double('Player', team: team2) }
  let(:goal1) { double('Goal', player: player1) }
  let(:goal2) { double('Goal', player: player1) }
  let(:goal3) { double('Goal', player: player2) }
  let(:goals) { [goal1] }

  describe "#==" do
    it 'should be equal if the goals are the same' do
      r1 = described_class.new(goals: goals)
      r2 = described_class.new(goals: goals)
      expect(r1).to eq r2
    end
  end

  describe 'attributes' do
    subject do
      described_class.new(goals: goals)
    end

    describe '#goals' do
			it { expect(subject.goals).to eq goals}
		end

    context 'one team scores more goals' do
      let(:goals) { [goal1, goal2, goal3] }
      describe '#winner' do
        it { expect(subject.winner).to eq team1}
      end

      describe '#type' do
        it { expect(subject.type).to eq 'win/lose'}
      end
    end

    context 'only one goal' do
      let(:goals) { [goal1] }
      describe '#winner' do
        it { expect(subject.winner).to eq team1}
      end

      describe '#type' do
        it { expect(subject.type).to eq 'win/lose'}
      end
    end

    context 'all goals by the same team' do
      let(:goals) { [goal1, goal1] }
      describe '#winner' do
        it { expect(subject.winner).to eq team1}
      end

      describe '#type' do
        it { expect(subject.type).to eq 'win/lose'}
      end
    end

    context 'no goals' do
      let(:goals) {[]}
      describe '#winner' do
        it { expect(subject.winner).to eq nil}
      end

      describe '#type' do
        it { expect(subject.type).to eq 'tie'}
      end
    end

    context 'same number of goals' do
      let(:goals) { [goal1, goal3] }
      describe '#winner' do
        it { expect(subject.winner).to eq nil}
      end

      describe '#type' do
        it { expect(subject.type).to eq 'tie'}
      end
    end
  end
end
