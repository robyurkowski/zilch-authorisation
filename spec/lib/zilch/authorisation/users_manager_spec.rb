require "spec_helper"
require "zilch/authorisation/users_manager"

RSpec.describe Zilch::Authorisation::UsersManager do
  it "has a primary user" do
    expect(subject).to respond_to(:primary_user)
  end

  it "expects an unmodified primary user to cause an exception" do
    expect { subject.primary_user }.to raise_error
  end
end
