require 'spec_helper'
require 'zilch/nil_user'

RSpec.describe Zilch::NilUser do
  it "has an approximate string representation" do
    expect(subject.to_s).to eq("Nil User")
  end

  describe "roles" do
    it "responds to #has_role?" do
      expect(subject).to respond_to(:has_role?)
    end

    it "should have all roles by default" do
      expect(subject).to have_role(:zilch)
      expect(subject).to have_role(:arbitrary)
    end
  end
end
