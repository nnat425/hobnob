class UserMailer < ApplicationMailer
  default from: 'info@hobnob.global'

  def confirmation_email(user, appointment)
    @user = user
    @appointment  = appointment
    mail(to: @user.email, subject: 'You Appointment has been set!')
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

end
