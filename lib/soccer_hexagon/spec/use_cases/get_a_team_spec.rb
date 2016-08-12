module SoccerHexagon::UseCases
  describe CreateATeam do
    subject { described_class.new }

    describe "#call" do
      it 'creates a team' do
        id = subject.call(name: "Westside").id
        expect(SoccerHexagon.new.query(:teams, id: id))
      end
    end
  end
end
