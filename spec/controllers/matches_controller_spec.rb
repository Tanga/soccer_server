describe MatchesController do
  let(:match)   { double('Match', as_json: {name: "A Match"}) }
  let(:hexagon) { double("Hexagon") }

  before do
    controller.register_hexagon(hexagon)
  end

  describe "Get show" do
    it do
      expect(hexagon).to receive(:query)
      get :show, id: 1
    end
  end

  describe "GET index" do
    it do
      allow(hexagon).to receive(:[]).with(:get_a_list_of_matches) { [match] }
      get :index
      expect(JSON.parse(response.body)).to eq([{'name' => "A Match"}])
    end
  end

  describe "POST create" do
    let(:use_case) { double("UseCase", errors: []) }
    before do
      allow(hexagon).to receive(:[]) { use_case }

      SoccerHexagon.new[:create_a_team, name: "Westside"]
      SoccerHexagon.new[:create_a_team, name: "Eastside"]
    end

    describe "" do
      it 'returns 400 on success' do
        post :create, on: Time.now, at_location: 1, between: [1,2]
        expect(response).to have_http_status(:created)
      end
    end

    describe "Unprocessible Entity" do
      let(:use_case) { double("UseCase", errors: ["error"], as_json: {errors: ["error"]}) }

      before do
        allow(hexagon).to receive(:[]) { use_case  }
        post :create
      end

      it 'returns 422 if invariants are violated' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns the errors in the body as json' do
        expect(JSON.parse(response.body)['errors']).to include('error')
      end
    end
  end
end
