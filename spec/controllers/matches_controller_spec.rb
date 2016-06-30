describe MatchesController do
  describe "GET index" do
    let(:match)   { double('Match', as_json: {name: "A Match"}) }

    let(:hexagon) {
      double('Hexagon',
      get_a_list_of_matches: [match],
      create_a_match:        match)
    }

    before do
      controller.register_hexagon(hexagon)
    end

    describe "GET index" do
      it do
        get :index
        expect(JSON.parse(response.body)).to eq([{'name' => "A Match"}])
      end
    end

    describe "POST create" do
      it do
        post :create
        expect(JSON.parse(response.body)).to eq({'name' => "A Match"})
      end
    end
  end
end
