require 'rails_helper'

feature "User views all questions", %{
  As a user I want to see all the questions asked
  So that I can choose one to answer or read the answers
  } do

  scenario "user views list of all questions, newest first" do
    question = FactoryGirl.build(:question)
    visit questions_path
    expect(page).to have_content question.title
  end

  scenario "user can click on link to see question page" do
    question = FactoryGirl.build(:question)
    visit questions_path
    click_on(question.title)
    expect(current_path).to eq(question_path(question))
  end
end
