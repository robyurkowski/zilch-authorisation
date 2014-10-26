require "spec_helper"
require "zilch/users_manager"

RSpec.describe Zilch::UsersManager do
  it "does not allow new instantiation" do
    expect { Zilch::UsersManager.new }.to raise_error
  end

  it "has a primary user" do
    expect(Zilch::UsersManager.instance).to respond_to(:primary_user)
  end

  it "expects an unmodified primary user to cause an exception" do
    expect { Zilch::UsersManager.instance.primary_user }.to raise_error
  end
end
