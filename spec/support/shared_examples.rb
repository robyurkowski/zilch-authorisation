shared_examples_for "zilch adapter" do
  let(:adapter) { double("NewAdapter") }

  describe "#adapter" do
    context "when given an adapter" do
      before do
        subject.adapter = adapter
      end

      it "uses that adapter" do
        expect(subject.adapter).to eq(adapter)
      end
    end

    context "when not given an adapter" do
      it "uses the default adapter" do
        default_adapter = double("DefaultAdapter")
        allow(subject).to receive(:default_adapter).and_return(default_adapter)
        expect(subject.adapter).to eq(default_adapter)
      end
    end
  end
end
