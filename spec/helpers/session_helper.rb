module SessionHelpers
  def sign_up_with(username, email, password)
    visit new_user_registration_path
    fill_in "Username", with: username
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    # select "Date of birth" "1999", "January", "1"
    fill_in "About", with: "Lorem Ipsum"
    fill_in "First name", with: "Jane"
    fill_in "Last name", with: "Smith"
    # split to first/last
    click_button "Sign up"
  end

  def sign_in_as(user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end
