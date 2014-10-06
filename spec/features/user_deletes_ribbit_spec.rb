require "rails_helper"

feature "User deletes ribbit", %{
  As a user, I want to delete my ribbit
  In case I post something inappropriate
  }do
  let(:ribbit) { FactoryGirl.create(:ribbit) }

  context "as an authenticated user" do
    scenario "when on own profile page" do
      sign_in_as ribbit.user
      visit student_path(ribbit.user)
      expect {find_link("Delete").click}.
        to change { Ribbit.count }.by(-1)
    end
    scenario "with another user's ribbit" do
      user2 = FactoryGirl.create(:user)
      ribbit2 = FactoryGirl.create(:ribbit, user: user2)
      expect(page).to_not have_link("Delete")
    end
  end

  context "as an unauthenticated user" do
    scenario "when on own profile page" do
      visit student_path(ribbit.user)
      expect(page).to_not have_link("Delete")
    end
  end
end
