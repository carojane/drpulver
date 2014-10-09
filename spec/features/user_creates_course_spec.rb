require "rails_helper"

feature "Admin creates course", %{
  As a teacher I want to post class information
  so that I can communicate the important features
  of the class with my students
  } do

  let(:course) { FactoryGirl.build(:course) }

  scenario "with neccessary information" do
    visit new_course_path
    fill_in "Name", with: course.name
    fill_in "Number", with: course.number
    select_date(course.start_date, ".start_date")
    select_date(course.end_date, ".end_date")
    expect { click_button "Create Course" }.
      to change { Course.count }.by(1)
    expect(page).to have_content(course.name)
    expect(page).to have_content(course.number)
  end

  scenario "with course details" do
    visit new_course_path
    fill_in "Name", with: course.name
    fill_in "Number", with: course.number
    fill_in "Meeting time", with: course.meeting_time
    fill_in "Description", with: course.description
    fill_in "Syllabus", with: course.syllabus
    select_date(course.start_date, ".start_date")
    select_date(course.end_date, ".end_date")
    click_button "Create Course"
    expect(page).to have_content(course.description)
    expect(page).to have_content(course.syllabus)
  end

  scenario "with no end or start date" do
    visit new_course_path
    fill_in "Name", with: course.name
    fill_in "Number", with: course.number
    expect { click_button "Create Course" }.
      to change { Course.count }.by(0)
    expect(page).to have_content("can't be blank")
  end

  scenario "with no name or number" do
    visit new_course_path
    select_date(course.start_date, ".start_date")
    select_date(course.end_date, ".end_date")
    expect { click_button "Create Course" }.
      to change { Course.count }.by(0)
    expect(page).to have_content("can't be blank")
  end

  scenario "with existing course" do
    course = FactoryGirl.create(:course)
    visit new_course_path
    fill_in "Name", with: course.name
    fill_in "Number", with: course.number
    select_date(course.start_date, ".start_date")
    select_date(course.end_date, ".end_date")
    expect { click_button "Create Course" }.
      to change { Course.count }.by(0)
    expect(page).to have_content("has already been taken")
  end
end
