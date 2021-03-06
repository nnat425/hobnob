require 'rails_helper'

feature "Signing up" do
  let(:user){ create(:user) }
  let(:user_attr){ attributes_for(:user) }
  let(:dummy_user) { create(:faker_user) }

  describe "with invalid information" do
    context "invalid email address" do
      scenario 'redirects to sign up page' do
        visit new_user_path
        fill_in "First Name", :with => user_attr[:first_name]
        fill_in "Last Name", :with => user_attr[:last_name]
        fill_in "Email", :with => "invalid_email"
        fill_in "Confirm Email", :with => "invalid_email"
        fill_in "Password", :with => user_attr[:password]
        fill_in "Password Confirmation", :with => user_attr[:password]
        click_button "Register"
        expect(page).to have_content "Signup!"
      end
    end

    context "email already taken" do
      scenario "flashes error message" do
        user
        visit new_user_path
        fill_in "First Name", :with => user_attr[:first_name]
        fill_in "Last Name", :with => user_attr[:last_name]
        fill_in "Email", :with => user[:email]
        fill_in "Confirm Email", :with => user[:email]
        fill_in "Password", :with => user_attr[:password]
        fill_in "Password Confirmation", :with => user_attr[:password]
        click_button "Register"
        expect(page).to have_content "Email has already been taken"
      end
    end

    context "password not matching" do
      scenario "flashes error message" do
        visit new_user_path
        fill_in "First Name", :with => user_attr[:first_name]
        fill_in "Last Name", :with => user_attr[:last_name]
        fill_in "Email", :with => user_attr[:email]
        fill_in "Confirm Email", :with => user_attr[:email]
        fill_in "Password", :with => user_attr[:password]
        fill_in "Password Confirmation", :with => "invalidpw"
        click_button "Register"
        expect(page).to have_content "Password confirmation doesn't match Password"
      end
    end
  end

  describe "with valid information" do
    scenario "redirects to profile page" do
      visit new_user_path
      fill_in "First Name", :with => user_attr[:first_name]
      fill_in "Last Name", :with => user_attr[:last_name]
      fill_in "Email", :with => user_attr[:email]
      fill_in "Confirm Email", :with => user_attr[:email]
      fill_in "Password", :with => user_attr[:password]
      fill_in "Password Confirmation", :with => user_attr[:password]
      click_button "Register"
      expect(page).to have_content "Thanks for signing up!"
    end
  end
end

feature "Logging in" do
  let(:user){ create(:user) }
  let(:user_attr){ attributes_for(:user) }

  describe "with invalid information" do

    before :each do
      user
    end

    scenario "shows login page" do
      visit login_path
      fill_in "Email", :with => user_attr[:email]
      fill_in "Password", :with => user[:password]
      click_button "Login"
      expect(page).to have_content("Login")
    end
  end


end
