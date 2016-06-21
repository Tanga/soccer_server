require 'rails_helper'

describe Fixtures::App do
  subject { described_class.new }

  let(:teams) { double("Teams") }
	let(:result) { double("Result") }
	let(:pitch) { double("Pitch") }

  describe '#create' do
    it 'creates a Fixture' do
      expect(create_fixture).to be
    end
  end

  describe '#read' do
    it 'should return a Fixture by id' do
      create_fixture
      expect(subject.read(1)).to be
    end
  end

  describe '#destroy' do
    it 'should destroy a Fixture' do
      fixture = create_fixture
      subject.delete(1)
      expect(subject.read(1)).to be_nil
    end
  end

  describe '#update' do
    xit 'should update'
  end

  def create_fixture
    subject.create teams: teams, result: result, pitch: pitch
  end
end
