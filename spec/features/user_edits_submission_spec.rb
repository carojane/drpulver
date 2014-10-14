require "rails_helper"

feature "user updates submission" do
  before :each do
    @submission = FactoryGirl.create(:submission)
    @enrollment = FactoryGirl.create(:enrollment,
                                     user: @submission.user,
                                     course: @submission.assignment.course)
    @submission2 = FactoryGirl.build(:submission)
    sign_in_as @submission.user
  end

  scenario "from assignment path" do
    visit course_assignment_path(@submission.assignment.course,
                                 @submission.assignment)
    click_on "Update Submission"
    fill_in "Body", with: @submission2.body
    click_button "Update Submission"
    expect(page).to have_content(@submission2.body)
  end
end
