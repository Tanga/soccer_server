RSpec.shared_examples "a Domain Match" do |parameter|
  describe 'attributes' do
    subject do
      described_class.new(
        id: 1,
        goals: [goal],
        pitch: pitch,
        teams: [teama, teamb])
    end

    describe '#id' do
      it { expect(subject.id).to eq 1 }
    end

    describe '#goals' do
      it { expect(subject.goals).to eq [goal] }
    end

    describe '#result' do
      it { expect(subject.result.class).to eq Matches::Result }
    end

    describe '#pitch' do
      it { expect(subject.pitch).to eq pitch }
    end

    describe '#teams' do
      it { expect(subject.teams).to eq [teama, teamb] }
    end
  end
end