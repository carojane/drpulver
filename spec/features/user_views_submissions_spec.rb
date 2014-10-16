require "rails_helper"

feature "User views Submission", %{
  As a professor, I want to see all submissions
  So that I can grade them
} do
  let!(:submission) {FactoryGirl.create(:submission)}

  scenario "on submissions index" do
    admin = FactoryGirl.create(:user, role: "admin")
    sign_in_as admin
    visit course_assignment_submissions_path(submission.assignment.course,
                                             submission.assignment)
    expect(page).to have_content(submission.body)
  end
end
