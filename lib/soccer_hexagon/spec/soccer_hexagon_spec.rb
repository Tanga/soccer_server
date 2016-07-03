describe SoccerHexagon do
  let(:teams) { [double('Team'), double('Team')] }
  let(:pitch) { double('Pitch') }
  subject     { described_class.new }

  describe "#create_a_match" do
    it do
      subject[:create_a_match,
        on:          Date.today,
        between:     teams,
        at_location: pitch]
    end
  end

  describe "#get_a_list_of_matches" do
    it do
      subject[:get_a_list_of_matches]
    end
  end
end
