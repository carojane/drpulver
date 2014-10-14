require "rails_helper"

feature "user views assignments", %{
  As a student I want to be
  able to view the assignments
  So that I know what is due when
  } do

  let!(:assignment) { FactoryGirl.create(:assignment) }

  scenario "on course page" do
    visit course_path(assignment.course)
    expect(page).to have_content(assignment.title)
    expect(page).to have_content(assignment.due_date.strftime("%b %-d, %Y"))
  end

  context "as an authenticated user" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in_as @user
    end

    scenario "from course page" do
      visit course_path(assignment.course)
      click_on assignment.title
      expect(page).to have_content(assignment.body)
    end

    scenario "on assignment page" do
      visit course_assignment_path(assignment.course.id, assignment)
      expect(page).to have_content(assignment.title)
      expect(page).to have_content(assignment.due_date.strftime("%b %-d, %Y"))
      expect(page).to have_content(assignment.body)
    end

    scenario "on assignments index" do
      assignment
      visit assignments_path
      expect(page).to have_content(assignment.title)
      expect(page).to have_content(assignment.due_date.strftime("%b %-d, %Y"))
    end
  end

  context "as an unauthenticated user" do
    scenario "from course page" do
      visit course_path(assignment.course)
      click_on assignment.title
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end
end
