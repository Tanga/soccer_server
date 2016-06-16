require 'rails_helper'

describe Fixtures::Season do
  subject { described_class.new(year: 2016) }

  describe 'attributes' do
    it '#year' do
      expect(subject.year).to eq 2016
    end
  end
end