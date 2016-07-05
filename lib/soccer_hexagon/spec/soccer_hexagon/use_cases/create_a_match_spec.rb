module SoccerHexagon::UseCases
  describe CreateAMatch do
    let(:repositories)     { double('Repositories') }
    subject                { described_class.new(repositories) }

    before do
      allow(repositories).to receive(:[]).with(:pitches) { double("Pitches", read: double("Pitch")) }
      allow(repositories).to receive(:[]).with(:teams)   { double("Teams", read: double("Team")) }
      allow(repositories).to receive(:[]).with(:matches) { double("Matches", create: double("UseCase", id: 1)) }
    end

    describe "#call" do
      it 'creates a match in the repository' do
        expect(repositories).to receive(:[])
          .with(:matches) { double("Matches", create: double("UseCase", id: 1)) }

        match = subject.call(
          on:          Date.today,
          between:     [double('Team'), double('Team')],
          at_location: double('Pitch'))
      end
    end
  end
end
