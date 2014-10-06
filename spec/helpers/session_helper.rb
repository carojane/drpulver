module SessionHelpers
  def sign_up_with(name, username, email, password)
    visit "/"
    click_link "Sign in"
    click_link "Sign up"
    fill_in "Username", with: username
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    # select "Date of birth" "1999", "January", "1"
    fill_in "About", with: "Lorem Ipsum"
    fill_in "Name", with: "Jane Doe"
    click_button "Sign up"
  end

  def sign_in_as(user)
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end
