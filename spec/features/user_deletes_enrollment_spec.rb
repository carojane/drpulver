require "rails_helper"

feature "User Deletes enrollment" do
  let!(:enrollment) { FactoryGirl.create(:enrollment) }

  scenario "on course path" do
    visit course_path(enrollment.course)
    expect { click_on "Remove" }.
      to change { Enrollment.count }.by(-1)
  end
end
