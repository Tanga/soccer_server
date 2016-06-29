describe MatchesController do
  describe "GET index" do
    let(:match)   { double('Match', as_json: "A Match") }
    let(:hexagon) { double('Hexagon', get_a_list_of_matches: [match]) }

    before do
      stub_const('SoccerHexagon', hexagon)
    end

    describe "GET Index" do
      it do
        get :index
        expect(JSON.parse(response.body)).to eq ["A Match"]
      end
    end
  end
end
