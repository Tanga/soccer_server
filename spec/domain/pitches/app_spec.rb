require 'rails_helper'

describe Pitches::App do
  subject { described_class.new }

  describe '#create' do
    it 'creates a pitch' do
      subject.create(name: "Highschool Stadium")
    end
  end
end