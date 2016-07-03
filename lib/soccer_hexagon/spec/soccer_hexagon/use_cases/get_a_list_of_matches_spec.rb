describe SoccerHexagon::UseCases::GetAListOfMatches do
  let(:teams)            { [double('Team'), double('Team')] }
  let(:pitch)            { double('Pitch') }
  let(:matches_repo)     { SoccerHexagon::Domain::Matches::Repository }
  subject                { described_class.new }

  before do
    @match = SoccerHexagon::UseCases::CreateAMatch.new.call(
      on:          Date.today,
      between:     teams,
      at_location: pitch
    )
  end

  describe "#call" do
    it 'lists matches' do
      expect(subject.call).to include @match
    end
  end
end
