require "rails_helper"

feature "Admin Deletes Assignment", %{
  As a teacher, I want to delete an assignment
  So that I can give my students a break
} do

  before :each do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    @course = FactoryGirl.create(:course)
    @assignment = FactoryGirl.create(:assignment, course: @course)
  end

  scenario "on course page" do
    visit course_path(@course)
    expect { click_link "X" }.
      to change { Assignment.count }.by(-1)
    expect(page).to have_content("Assignment sucessfully deleted.")
  end

  scenario "on assignment page" do
    visit course_assignment_path(@course, @assignment)
    expect { click_link "Delete Assignment" }.
      to change { Assignment.count }.by(-1)
    expect(page).to have_content("Assignment sucessfully deleted.")
  end
end
