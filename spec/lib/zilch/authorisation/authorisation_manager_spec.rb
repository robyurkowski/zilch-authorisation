require "spec_helper"
require "zilch/authorisation/authorisation_manager"

RSpec.describe Zilch::Authorisation::AuthorisationManager do
  describe "authentication" do
    let(:user) { double("user") }

    context "when can find a user" do
      before do
        allow(subject).to receive_message_chain('user_factory.call').and_return user
      end

      describe "#authenticate" do
        it "#returns true" do
          expect(subject.authenticate).to be true
        end

        it "sets the current user" do
          subject.authenticate
          expect(subject.current_user).to eq user
        end
      end
    end

    context "when cannot find a user" do
    end

    context "when could not set a current user" do
    end

    it "gives access to a current_user" do
      user = double("User")
      user_factory = double("User factory", call: user)

      allow(subject).to receive(:user_factory).and_return(user_factory)
      expect(subject.current_user).to eq(user)
    end

    describe "permissions" do
      it "is authenticated by default" do
        expect(subject.authenticate).to be_truthy
        expect(subject.authenticated?).to be_truthy
      end

      it "allows access to action" do
        expect(subject.allow?(:do_something)).to be true
      end
    end
  end
end
