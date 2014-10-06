require "rails_helper"

feature "User signs up", %{
  As a student, I want to sign update
  So that I can access the site features
  } do
  let(:user) { FactoryGirl.build(:user) }

  scenario "with valid email, username and password" do
    sign_up_with user.username,
                 user.email,
                 user.password
    expect(page).to have_content(/Welcome!/)
    # redirects to student_path(current_user)
  end
  scenario "with invalid email" do
    sign_up_with user.username,
                 "",
                 user.password
    expect(page).to have_content("Sign in")
    # expect error
  end
  scenario "with blank password" do
    sign_up_with user.username,
                 user.email,
                 ""
    expect(page).to have_content("Sign in")
    # expect error
  end
  scenario "with blank username" do
    sign_up_with "",
                 user.email,
                 user.password
    expect(page).to have_content("Sign in")
    # expect error
  end
end
