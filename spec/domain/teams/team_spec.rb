require 'rails_helper.rb'

describe Teams::Team do
  subject {described_class.new(name: 'Bethlehem Steel FC', id: 1)}

  describe("attributes") do
    describe("#id") do
      it { expect(subject.id).to eq(1)}
    end
  end
end
