require 'spec_helper'
require 'zilch/authorisation/nil_user'

RSpec.describe Zilch::Authorisation::NilUser do
  it "has an approximate string representation" do
    expect(subject.to_s).to eq("Zilch::Authorisation::NilUser")
  end
end
