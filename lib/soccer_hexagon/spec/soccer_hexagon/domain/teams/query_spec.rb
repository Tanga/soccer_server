describe SoccerHexagon::Domain::Teams::Query do
  subject { described_class.new }

  describe 'with an id' do
    it { subject.call(id: 1) }
  end
end
