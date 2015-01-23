require "spec_helper"
require "zilch/authorisation/authorisation_manager"

RSpec.describe Zilch::Authorisation::AuthorisationManager do
  let(:adapter) { double("NewAdapter") }

  describe "authentication" do
    before do
      subject.adapter = adapter
    end

    describe "#authenticate" do
      it "asks the adapter" do
        expect(adapter).to receive(:authenticate)
        subject.authenticate
      end
    end


    describe "#authenticated?" do
      it "asks the adapter" do
        expect(adapter).to receive(:authenticated?)
        subject.authenticated?
      end
    end


    describe "#current_user" do
      it "asks the adapter" do
        expect(adapter).to receive(:current_user)
        subject.current_user
      end
    end


    describe "#allow?" do
      it "asks the adapter" do
        expect(adapter).to receive(:allow?)
        subject.allow?
      end
    end


    describe "#authenticate!" do
      it "asks the adapter" do
        allow(adapter).to receive(:current_user)
        expect(adapter).to receive(:authenticate!).and_return true
        subject.authenticate!
      end

      context "when not authenticated" do
        it "throws an exception" do
          allow(adapter).to receive(:authenticate!).and_return false
          expect { subject.authenticate! }.to raise_exception Zilch::Authorisation::NotAuthorisedException
        end
      end

      context "when authenticated" do
        it "returns the current user" do
          allow(adapter).to receive(:authenticate!).and_return true
          expect(adapter).to receive(:current_user)
          subject.authenticate!
        end
      end
    end
  end


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
      it "calls the default proc" do
        default_adapter = double("DefaultAdapter")
        allow(subject).to receive(:default_adapter).and_return(default_adapter)
        expect(subject.adapter).to eq(default_adapter)
      end
    end
  end


  describe "#adapter=" do
    it "allows the adapter to be set" do
      adapter = double("NewAdapter")
      subject.adapter = adapter
      expect(subject.adapter).to eq(adapter)
    end
  end
end
