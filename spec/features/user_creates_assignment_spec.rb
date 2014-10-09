require "rails_helper"

feature "admin adds assignments", %{
  As a teacher I want create assignments
  so that students are kept busy
  } do

  let(:course) { FactoryGirl.create(:course) }
  let(:assignment) { FactoryGirl.build(:assignment, course: course) }

  before :each do
    visit new_course_assignment_path(course)
    click_on "New Assignment"
  end

  scenario "with relevant information" do
    fill_in "Title", with: assignment.title
    fill_in "Body", with: assignment.body
    select_date(assignment.due_date, ".due_date")
    expect { click_on "New Assignment" }.
      to change { Assignment.count }.by(1)
  end

  scenario "with missing title" do
    fill_in "Body", with: assignment.body
    select_date(assignment.due_date, ".due_date")
    expect { click_on "New Assignment" }.
      to change { Assignment.count }.by(0)
  end

  scenario "with missing body" do
    fill_in "Title", with: assignment.title
    select_date(assignment.due_date, ".due_date")
    expect { click_on "New Assignment" }.
      to change { Assignment.count }.by(0)
  end

  scenario "with missing due date" do
    fill_in "Title", with: assignment.title
    fill_in "Body", with: assignment.body
    expect { click_on "New Assignment" }.
      to change { Assignment.count }.by(0)
  end
end
