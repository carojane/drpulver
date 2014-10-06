require "rails_helper"

feature "User creates ribbit", %{
  As a user I want to create a ribbit,
  So that I can share my innermost thoughts
  } do

  context "as an authenticated user" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in_as @user
    end

    scenario "when on student profile" do
      visit student_path(@user)
      fill_in "ribbit_content", with: "Ipsum Lorem"
      expect { click_button "Ribbit!" }
        .to change{ Ribbit.count }.by(1)
      expect(current_path).to eq(student_path(@user))
    end

    scenario "when on ribbits page" do
      visit ribbits_path
      fill_in "ribbit_content", with: "Ipsum Lorem"
      expect { click_button "Ribbit!" }
        .to change{ Ribbit.count }.by(1)
      expect(current_path).to eq(student_path(@user))
    end

    scenario "without content" do
      visit ribbits_path
      expect { click_button "Ribbit!" }
        .to change{ Ribbit.count }.by(0)
      expect(current_path).to eq(student_path(@user))
    end
  end

  context "as an unauthenicated user" do
  end
end
