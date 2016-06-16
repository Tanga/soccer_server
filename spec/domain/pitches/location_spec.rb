require 'rails_helper'

describe Pitches::Location do
  subject { described_class.new(name: "Back of School") }

  describe 'attributes' do
    describe("#name") do
      it { expect(subject.name).to eq("Back of School") }
    end
  end
end
