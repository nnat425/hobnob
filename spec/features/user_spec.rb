require 'rails_helper'

feature "Signing up" do
  let(:user){ create(:user) }
  let(:user_attr){ attributes_for(:user) }

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
  end
end