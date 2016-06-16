require 'rails_helper'

describe Teams::App do
  subject { described_class.new }

  describe '#create' do
    it 'creates a team' do
      subject.create(name: "Highschool Stadium")
    end
  end
end