require "rails_helper"

feature "admin edits course", %{
  As a teacher I want to be able to
  update the class information
  so that the information stays
  up to date in case of changes
} do

  scenario "with relevant information" do
    course = FactoryGirl.create(:course)
    new_course = FactoryGirl.build(:course)
    visit edit_course_path(course)
    fill_in "Name", with: new_course.name
    click_on "Update"
    expect(page).to have_content(new_course.name)
    expect(page).to_not have_content(course.name)
  end
end
