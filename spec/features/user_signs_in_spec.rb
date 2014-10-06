require "rails_helper"

feature "User signs in", %{
  As a user, I want to sign in
  So that I can access restricted information
  }do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  scenario "with valid email and password" do
    sign_in_as @user
    expect(page).to have_content(/Signed in successfully./)
  end

  scenario "with unregistered email" do
    sign_in_as FactoryGirl.build(:user,
                                 email: "unregistered@email.com")
    expect(page).to have_content(/Invalid email/)
  end

  scenario "with invalid password" do
    sign_in_as FactoryGirl.build(:user,
                                 email: @user.email,
                                 password: ""
                                 )
    expect(page).to have_content(/Invalid email/)
  end
end
