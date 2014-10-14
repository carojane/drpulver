require "rails_helper"

feature "user creates submission" do
  before :each do
    @assignment = FactoryGirl.create(:assignment)
    @submission = FactoryGirl.create(:submission)
    @user = FactoryGirl.create(:user)
    sign_in_as @user
  end

  scenario "with valid information" do
    visit course_assignment_path(@assignment.course, @assignment)
    fill_in "Submission", with: @submission.body
    expect { click_on "Create Submission" }.
      to change { Submission.count }.by(1)
  end

  scenario "without valid information" do
  end
end
