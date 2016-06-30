describe SoccerHexagon do

  let(:teams) { [double('Team'), double('Team')] }
  let(:pitch) { double('Pitch') }
  subject { described_class.new }


  describe "#create_a_match" do
    it do
      subject.create_a_match(
      on: Date.today,
      between: teams,
      at_location: pitch)
    end
  end
end
