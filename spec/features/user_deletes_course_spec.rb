require "rails_helper"

feature "admin deletes course", %{
  As a teacher I want to be able to
  delete the class information
  in case the class is cancelled
} do

  context "as an authorized user (admin" do
    scenario "from course page" do
      @user = FactoryGirl.create(:user, role: "admin")
      sign_in_as @user
      @course = FactoryGirl.create(:course)
      visit course_path(@course)
      expect { click_on("Delete Course") }.
        to change { Course.count }.by(-1)
    end
  end

  context "as an unauthorized user" do
    scenario "on course page" do
      @course = FactoryGirl.create(:course)
      visit course_path(@course)
      expect(page).to_not have_link("Delete Course")
    end
  end
end
