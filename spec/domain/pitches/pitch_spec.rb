require 'rails_helper'

describe Pitches::Pitch do
  subject { described_class.new(id: 1, name: "Somewhere") }

  let(:location) { instance_double(Pitches::Location)}

  describe 'attributes' do
    describe('#id') do
      it { expect(subject.id).to eq 1}
    end
  end
end