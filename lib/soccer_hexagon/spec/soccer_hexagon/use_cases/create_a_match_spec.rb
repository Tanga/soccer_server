module SoccerHexagon::UseCases
  describe CreateAMatch do
    let(:matches_repo)     { SoccerHexagon::Domain::Matches::Repository }
    subject                { described_class.new }

    describe "#call" do
      it 'creates a match' do
        match = subject.call(
          on:          Date.today,
          between:     [double('Team'), double('Team')],
          at_location: double('Pitch')
        )
        expect(matches_repo.read(match.id)).to eq match
      end
    end
  end
end
