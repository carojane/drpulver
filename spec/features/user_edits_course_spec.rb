require "rails_helper"

feature "admin edits course", %{
  As a teacher I want to be able to
  update the class information
  so that the information stays
  up to date in case of changes
} do

  context "as an authorized user" do
    scenario "with relevant information" do
      user = FactoryGirl.create(:user, role: "admin")
      sign_in_as user
      course = FactoryGirl.create(:course)
      new_course = FactoryGirl.build(:course)
      visit edit_course_path(course)
      fill_in "Name", with: new_course.name
      click_on "Update"
      expect(page).to have_content(new_course.name)
      expect(page).to_not have_content(course.name)
    end
  end

  context "as an unauthorized user" do
    before :each do
      @course = FactoryGirl.create(:course)
    end

    scenario "from course path" do
      visit course_path(@course)
      expect(page).to_not have_link("Edit Course")
    end

    scenario "on edit course path" do
      expect { visit edit_course_path(@course) }.
        to raise_error(ActionController::RoutingError)
    end
  end
end
