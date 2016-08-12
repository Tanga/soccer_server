# this represents the behavior of objects that want to prented to be domain objects
RSpec.shared_examples "a Domain Match" do
  describe 'attributes' do
    subject do
      described_class.new(id: 1, pitch: pitch, teams: teams, datetime: datetime )
    end

    describe '#id' do
      it { expect(subject.id).to eq 1 }
    end

		describe '#pitch' do
			it { expect(subject.pitch).to eq pitch }
		end

		describe '#teams' do
			it { expect(subject.teams).to eq teams }
		end

    describe '#goals=' do
      before do
        subject.goals = [goal]
      end
      it { expect(subject.goals).to eq goals }
    end

    describe '#result' do
      it { expect(subject.result).to be_a(SoccerHexagon::Domain::Matches::Result) }
    end

		describe '#datetime' do
			it { expect(subject.datetime).to eq datetime}
		end
  end
end
