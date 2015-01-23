require "spec_helper"
require "zilch/authorisation/authorisation_manager"

RSpec.describe Zilch::Authorisation::AuthorisationManager do
  describe "authentication" do
    let(:adapter) { double("NewAdapter") }

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

  describe "adapter" do
    it_behaves_like "zilch adapter"
  end
end
