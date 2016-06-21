# this represents the behavior of objects that want to prented to be domain objects
RSpec.shared_examples "a Domain Fixture" do
  describe 'attributes' do
    subject do
      described_class.new(id: 1, teams: teams, result: result, pitch: pitch )
    end

    describe '#id' do
      it { expect(subject.id).to eq 1 }
    end

		describe '#teams' do
			it { expect(subject.teams).to eq teams}
		end

		describe '#result' do
			it { expect(subject.result).to eq result}
		end

		describe '#pitch' do
			it { expect(subject.pitch).to eq pitch}
		end
  end
end
