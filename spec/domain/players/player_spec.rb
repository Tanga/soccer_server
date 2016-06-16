require 'rails_helper.rb'

describe Players::Player do
  subject {described_class.new(name: "Chris Young", team: team, id: 1)}
  let(:team) {instance_double(Teams::Team)}

  describe '#new' do
    describe("#name") do
      it { expect(subject.name).to eq "Chris Young" }
    end
    describe("#team") do
      it { expect(subject.team).to eq team}
    end
    describe("#id") do
      it { expect(subject.id).to eq 1}
    end
  end
end
