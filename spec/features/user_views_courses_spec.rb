require "rails_helper"

feature "User views courses", %{
  As a student I want to be able to access the class information
  so that I know what is going on in class
  } do

  scenario "with course info" do
    course = FactoryGirl.create(:course)
    visit courses_path
    save_and_open_page
    expect(page).to have_content(course.number)
    expect(page).to have_content(course.meeting_time)
    click_on course.name
    expect(page).to have_content(course.description)
    expect(page).to have_content(course.syllabus)
  end
end
