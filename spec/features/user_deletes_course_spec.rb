require "rails_helper"

feature "admin deletes course", %{
  As a teacher I want to be able to
  delete the class information
  in case the class is cancelled
} do

  scenario "from course page" do
    course = FactoryGirl.create(:course)
    visit course_path(course)
    expect { click_on("Delete") }.
      to change { Course.count }.by(-1)
  end
end
