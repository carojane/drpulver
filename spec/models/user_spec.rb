require "rails_helper"

describe "#admin?" do
  it "is not an admin if the role is not admin" do
    user = User.new(role: "member")
    expect(user).to_not be_admin
  end

  it "is an admin if the role is admin" do
    user = User.new(role: "admin")
    expect(user).to be_admin
  end
end
