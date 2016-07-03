module SoccerHexagon::UseCases
  describe GetAListOfMatches do
    subject { described_class.new }

    before do
      @match = CreateAMatch.new.call(
        on:          Date.today,
        between:     [double('Team'), double('Team')],
        at_location: double('Pitch')
      )
    end

    describe "#call" do
      it 'lists matches' do
        expect(subject.call).to include @match
      end
    end
  end
end
