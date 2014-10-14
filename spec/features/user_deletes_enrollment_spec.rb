require "rails_helper"

feature "User Deletes enrollment" do
  let!(:enrollment) { FactoryGirl.create(:enrollment) }

  context "as an authorized user (admin)" do
    scenario "on course path" do
      user = FactoryGirl.create(:user, role: "admin")
      sign_in_as user
      visit course_path(enrollment.course)
      expect { click_on "Remove" }.
        to change { Enrollment.count }.by(-1)
    end
  end

  context "as an unauthorized user" do
    scenario "on course path" do
      user = FactoryGirl.create(:user)
      sign_in_as user
      visit course_path(enrollment.course)
      expect(page).to_not have_link("Remove")
    end
  end
end
