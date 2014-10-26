require "spec_helper"
require "zilch/authorisation_manager"

RSpec.describe Zilch::AuthorisationManager do
  describe "authentication" do
    subject { Zilch::AuthorisationManager.instance }

    it "works" do
      expect(subject).to respond_to(:authenticate!)
    end

    it "gives access to a current_user" do
      user = double("User")
      user_factory = double("User factory", call: user)

      allow(subject).to receive(:user_factory).and_return(user_factory)
      expect(subject.current_user).to eq(user)
    end

    describe "permissions" do
      it "is authenticated by default" do
        expect(subject.authenticate!).to be_truthy
        expect(subject.authenticated?).to be_truthy
      end

      it "allows access to every controller" do
        expect(subject.allow_access_to_controller?("obvious/fake")).to be true
      end

      it "has all roles" do
        expect(subject).to have_role('obvious_fake')
      end
    end
  end
end
