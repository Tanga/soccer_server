describe SoccerHexagon::Utilities::Queries do
  subject { described_class.new }

  describe '#[]' do
    it { expect(subject[:teams]).to be }
  end
end
