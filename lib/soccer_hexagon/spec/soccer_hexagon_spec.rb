describe SoccerHexagon do

  let(:teams) { [double('Team'), double('Team')] }
  let(:pitch) { double('Pitch') }

  describe "#create_a_match" do
    before do
      described_class.repositories
    end
    it do
      described_class.create_a_match(
      on: Date.today,
      between: teams,
      at_location: pitch)
    end
  end
end
