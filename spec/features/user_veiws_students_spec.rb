require "rails_helper"

feature "User views students" do
  let(:user) { FactoryGirl.create(:user) }

  context "as an unathenticated user" do
    before :each do
      @user2 = FactoryGirl.create(:user)
      sign_in_as user
    end

    scenario "with student index" do
      visit students_path
      expect(page).to have_link("@#{user.username}")
      expect(page).to have_link("@#{@user2.username}")
    end

    scenario "with my profile" do
      visit student_path(user)
      expect(page).to have_content("@#{user.username}")
      expect(page).to have_content("My Courses")
      expect(page).to have_button("Ribbit!")
      expect(page).to have_link("Update Profile")
    end

    scenario "with another user's profile" do
      visit student_path(@user2)
      expect(page).to have_content("@#{@user2.username}")
      expect(page).to_not have_content("My Courses")
      expect(page).to_not have_button("Ribbit!")
      expect(page).to_not have_link("Update Profile")
    end
  end

  context "as an authenticated user" do
    scenario "with student index" do
      visit students_path
      expect(page).to have_content(
        "You need to sign in or sign up before continuing."
        )
    end

    scenario "with student's profile" do
      visit student_path(user)
      expect(page).to have_content(
        "You need to sign in or sign up before continuing."
        )
    end
  end
end
