require "rails_helper"

feature "user views enrollment", %{
  As a user I want to view who is enrolled in a course
  So that I can see who is enrolled in a course
} do

  let!(:course) { FactoryGirl.create(:course) }
  let!(:enrollment) { FactoryGirl.create(:enrollment, course: course) }


  context "as authenticated user" do
    before :each do
      sign_in_as enrollment.user
    end

    scenario "on course index" do
      visit course_path(course)
      expect(page).to have_content("@" + enrollment.user.username)
    end

    scenario "on profile page" do
      visit student_path(enrollment.user.id)
      expect(page).to have_content(enrollment.course.name)
    end
  end

  context "as an unauthenticated user" do
    scenario "on profile page" do
      visit student_path(enrollment.user.id)
      expect(page).to_not have_content(enrollment.course.name)
    end

    scenario "on course index" do
      visit course_path(course)
      expect(page).to_not have_content("@" + enrollment.user.username)
    end
  end
end
