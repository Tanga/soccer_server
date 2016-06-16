RSpec.shared_examples "a Domain Fixture" do |parameter|
  describe 'attributes' do
    subject do
      described_class.new(
        id: 1,
        pitch: pitch,
        teams: [team],
        season: 2016,
        date: date,
        match: match)
    end

    let(:date) { Date.today }

    describe '#id' do
      it { expect(subject.id).to eq 1 }
    end

    describe "#pitch" do
      it { expect(subject.pitch).to eq pitch }
    end

    describe '#teams' do
      it { expect(subject.teams).to eq [team] }
    end

    describe '#season' do
      it { expect(subject.season.class).to eq Fixtures::Season }
    end

    describe '#date' do
      it { expect(subject.date).to eq date }
    end

    describe '#match' do
      it { expect(subject.match).to eq match }
    end

  end
end