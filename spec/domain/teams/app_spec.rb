require 'rails_helper'

describe Teams::App do
  subject { described_class.new }

  let(:name) { double("Name") }

  describe '#create' do
    it 'creates a Team' do
      expect(create_team).to be
    end
  end

  describe '#read' do
    it 'should return a Team by id' do
      create_team
      expect(subject.read(1)).to be
    end
  end

  describe '#destroy' do
    it 'should destroy a Team' do
      team = create_team
      subject.delete(1)
      expect(subject.read(1)).to be_nil
    end
  end

  describe '#update' do
    xit 'should update'
  end

  def create_team
    subject.create name: name
  end
end
