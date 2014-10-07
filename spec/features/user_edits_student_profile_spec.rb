require "rails_helper"

feature "User edits student profile" do
  let(:user) { FactoryGirl.create(:user) }
  let(:student) { Student.find_by(user: user) }
  let(:profile) { FactoryGirl.build(:student) }

  context "as an authenticated user" do
    before :each do
      sign_in_as user
      visit student_path(user)
      click_on "Update Profile"
    end

    scenario "with valid date of birth, bio and name" do
      fill_in "First name", with: profile.first_name
      fill_in "Last name", with: profile.last_name
      select "January", from: "student[date_of_birth(2i)]"
      select 3, from: "student[date_of_birth(3i)]"
      select 1990, from: "student[date_of_birth(1i)]"
      fill_in "About", with: profile.bio
      click_button "Update Student"
      expect(page).to have_content(profile.full_name)
      expect(page).to have_content(profile.date_of_birth)
      expect(page).to have_content(profile.bio)
    end

    scenario "with just first name" do
      fill_in "First name", with: profile.first_name
      click_button "Update Student"
      expect(page).to have_content(profile.first_name)
      expect(page).to_not have_content(profile.full_name)
    end

    scenario "with no information entered" do
      click_button "Update Student"
      expect(page).to_not have_content(profile.full_name)
      expect(page).to_not have_content(profile.bio)
    end
  end

  context "as an unauthenticated user" do
    scenario "with another user's profile" do
      visit student_path(user)
      expect(page).to_not have_link("Update Profile")
    end
  end
end
