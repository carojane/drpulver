require "rails_helper"

feature "user creates submission" do

  context "as an enrolled student" do
    before :each do
      @submission = FactoryGirl.build(:submission)
      @assignment = @submission.assignment
      @enrollment = FactoryGirl.create(:enrollment, course: @assignment.course)
      @user       = @enrollment.user
      sign_in_as @user
    end

    scenario "with valid information" do
      visit course_assignment_path(@assignment.course, @assignment)
      fill_in "Body", with: @submission.body
      expect { click_on "Create Submission" }.
        to change { Submission.count }.by(1)
      expect(page).to have_content(@submission.body)
    end

    scenario "without valid information" do
      visit course_assignment_path(@assignment.course, @assignment)
      click_on "Create Submission"
      expect(page).to have_content("can't be blank")
      expect(page).to_not have_content(@submission.body)
    end
  end

  context "as an unenrolled student" do
    scenario "on assignment page" do
      @assignment = FactoryGirl.create(:assignment)
      user = FactoryGirl.create(:user)
      sign_in_as user
      visit course_assignment_path(@assignment.course, @assignment)
      expect(page).to_not have_content("Submission")
    end
  end
end
