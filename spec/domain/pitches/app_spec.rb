require 'rails_helper'

describe Pitches::App do
  subject { described_class.new }

  let(:name) { double("Name") }

  describe '#create' do
    it 'creates a Pitch' do
      expect(create_pitch).to be
    end
  end

  describe '#read' do
    it 'should return a Pitch by id' do
      create_pitch
      expect(subject.read(1)).to be
    end
  end

  describe '#destroy' do
    it 'should destroy a Pitch' do
      pitch = create_pitch
      subject.delete(1)
      expect(subject.read(1)).to be_nil
    end
  end

  describe '#update' do
    xit 'should update'
  end

  def create_pitch
    subject.create name: name
  end
end
