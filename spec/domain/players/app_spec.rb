require 'rails_helper'

describe Players::App do
  subject { described_class.new }

  describe '#create' do
    it 'can create a single player' do
      subject.create(name: 'Jim Charleston')
    end

    it 'can create several players at once' do
      subject.create([{ name: 'Jim Charleston' }, { name: 'Fred Charleston' }])
    end
  end
end