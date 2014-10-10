require "rails_helper"

feature "", %{
  As a teacher I want to be able to update assignments
  so that I can change my mind
  } do

  scenario "with relevant information" do
    assignment = FactoryGirl.create(:assignment)
    new_assignment = FactoryGirl.build(:assignment)
    visit edit_course_assignment_path(assignment.course, assignment)
    fill_in "Title", with: new_assignment.title
    fill_in "Body", with: new_assignment.body
    select_date(new_assignment.due_date, ".due_date")
    click_button "Update Assignment"
    expect(page).to have_content("Course sucessfully updated.")
    expect(page).to have_content(new_assignment.title)
    expect(page).to have_content(new_assignment.body)
    expect(page).to have_content(new_assignment.due_date.strftime("%b %-d, %Y"))
    expect(page).to have_content("Course sucessfully updated.")
  end
end
