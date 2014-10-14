require "rails_helper"

feature "admin adds assignments", %{
  As a teacher I want create assignments
  so that students are kept busy
  } do

  let!(:course) { FactoryGirl.create(:course) }
  let!(:assignment) { FactoryGirl.build(:assignment, course: course) }

  context "as an admin" do
    before :each do
      @user = FactoryGirl.create(:user, role: "admin")
      sign_in_as @user
      visit course_path(course)
      click_on "New Assignment"
    end

    scenario "with relevant information" do
      fill_in "Title", with: assignment.title
      fill_in "Body", with: assignment.body
      select_date(assignment.due_date, ".due_date")
      expect { click_on "Create Assignment" }.
        to change { Assignment.count }.by(1)
    end

    scenario "with missing title" do
      fill_in "Body", with: assignment.body
      select_date(assignment.due_date, ".due_date")
      expect { click_on "Create Assignment" }.
        to change { Assignment.count }.by(0)
    end

    scenario "with missing body" do
      fill_in "Title", with: assignment.title
      select_date(assignment.due_date, ".due_date")
      expect { click_on "Create Assignment" }.
        to change { Assignment.count }.by(0)
    end

    scenario "with missing due date" do
      fill_in "Title", with: assignment.title
      fill_in "Body", with: assignment.body
      expect { click_on "Create Assignment" }.
        to change { Assignment.count }.by(0)
    end
  end

  context "as an unauthorized user" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in_as @user
    end

    scenario "on course page" do
      visit course_path(course)
      expect(page).to_not have_link("New Assignment")
    end

    scenario "on new assignment path" do
      expect{ visit new_course_assignment_path(course) }.
        to raise_error(ActionController::RoutingError)
    end
  end

  context "as an unauthenticated user" do
    scenario "on course page" do
      visit course_path(course)
      expect(page).to_not have_link("New Assignment")
    end

    scenario "on new assignment path" do
      expect{ visit new_course_assignment_path(course) }.
        to raise_error(ActionController::RoutingError)
    end
  end
end
