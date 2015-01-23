require "spec_helper"
require "zilch/authorisation/users_manager"

RSpec.describe Zilch::Authorisation::UsersManager do
  describe "users" do
    let(:adapter) { double("NewAdapter") }

    before do
      subject.adapter = adapter
    end

    describe "primary user" do
      it "asks the adapter" do
        expect(adapter).to receive(:primary_user)
        subject.primary_user
      end
    end
  end

  describe "adapter" do
    it_behaves_like "zilch adapter"
  end
end
