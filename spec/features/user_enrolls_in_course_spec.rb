require "rails_helper"

feature "User enrolls in course" do

  context "as an authorized user" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in_as @user
      @course = FactoryGirl.create(:course)
    end

    scenario "on course index" do
      visit courses_path
      click_link @course.name
      expect { click_on "Enroll" }.
        to change { Enrollment.count }.by(1)
      expect(current_path).to eq(course_path(@course))
      expect(page).to_not have_content("Enroll")
    end
  end

  context "as an unauthorized user" do
    scenario "on course path" do
      @course = FactoryGirl.create(:course)
      visit course_path(@course)
      expect(page).to_not have_content("Enroll")
    end
  end
end
