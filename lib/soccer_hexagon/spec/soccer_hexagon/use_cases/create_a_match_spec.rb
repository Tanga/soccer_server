describe SoccerHexagon::UseCases::CreateAMatch do
  let(:teams)            { [double('Team'), double('Team')] }
  let(:pitch)            { double('Pitch') }
  let(:matches_repo)     { SoccerHexagon::Domain::Matches::Repository }
  subject                { described_class.new }

  describe "#call" do
    it 'creates a match' do
      match = subject.call(
        on:          Date.today,
        between:     teams,
        at_location: pitch
      )
      expect(matches_repo.read(match.id)).to eq match
    end
  end
end
