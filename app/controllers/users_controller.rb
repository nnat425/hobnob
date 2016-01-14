class UsersController < ApplicationController

  def new
    @user = User.new
  end



  def create
    user = User.new(user_params)
    if user.save && user.valid?
      session[:user_or_advisor_id] = user.id
      session[:class_type] = "User"
      flash[:message] = "Thanks for signing up!"
      UserMailer.account_activation(user).deliver_now
      user.carts.create
      redirect_to user_path(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @booked_appointments = @user.booked_appointments
  end

  def email_confirm
    @user = User.find(params[:id])
  end

  def update
    user = User.find_by(id: params[:id])
    if user
      user.update(email_verified:true, email_confirmation: user.email)
      flash[:email_verified] = "Email has been verified"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :email_confirmation, :student,  :school, :program, :graduation_date)
  end

end



 # <p><%= form_for @user, :url => users_verify_path(@user.id) do |f| %> </p>
 # <%= f.submit 'Submit' %>
 # <% end %>