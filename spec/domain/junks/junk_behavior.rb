RSpec.shared_examples "a Domain Junk" do |parameter|
  describe 'attributes' do
    subject do
      described_class.new(id: 1)
    end

    describe '#id' do
      it { expect(subject.id).to eq 1 }
    end
  end
end