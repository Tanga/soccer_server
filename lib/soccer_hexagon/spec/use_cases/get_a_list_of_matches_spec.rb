module SoccerHexagon::UseCases
  describe GetAListOfMatches do
    subject { described_class.new(repositories) }
    let(:repositories) { double("Repositories") }

    describe "#call" do
      it 'lists matches' do
        expect(repositories).to receive(:[]).with(:matches) { double("Repository", query: []) }
        subject.call
      end
    end
  end
end
