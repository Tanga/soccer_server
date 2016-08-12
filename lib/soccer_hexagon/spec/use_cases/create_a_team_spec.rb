module SoccerHexagon::UseCases
  describe CreateATeam do
    subject { described_class.new(repositories) }
    let(:repositories) { double('Repositories') }

    before do

    end

    describe "#call" do
      it 'creates a team' do
        expect(repositories).to receive(:[]).with(:teams) { double("Teams", create: double("Team", id: 1)) }
        id = subject.call(name: "Westside").id
      end
    end
  end
end
