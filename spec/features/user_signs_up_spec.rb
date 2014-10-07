require "rails_helper"

feature "User signs up", %{
  As a student, I want to sign up
  So that I can access the site features
  } do
  let(:user) { FactoryGirl.build(:user) }

  scenario "with valid email, username and password" do
    sign_up_with user.username,
                 user.email,
                 user.password
    expect(page).to have_content(/Welcome!/)
    current_user = User.last
    expect(current_path).to eq(student_path(current_user))
  end
  scenario "with invalid email" do
    sign_up_with user.username,
                 "",
                 user.password
    expect(page).to have_content(/Email is invalid/)
    expect(current_path).to eq(user_registration_path)
  end
  scenario "with blank password" do
    sign_up_with user.username,
                 user.email,
                 ""
    expect(page).to have_content(/Password can't be blank/)
    expect(current_path).to eq(user_registration_path)
  end
  scenario "with blank username" do
    sign_up_with "",
                 user.email,
                 user.password
    expect(page).to have_content(/Username can't be blank/)
    expect(current_path).to eq(user_registration_path)
  end

  scenario "with existing username" do
    user = FactoryGirl.create(:user)
    sign_up_with user.username,
                 user.email,
                 user.password
    expect(page).to have_content(/Email has already been taken/)
    expect(current_path).to eq(user_registration_path)
  end
end
