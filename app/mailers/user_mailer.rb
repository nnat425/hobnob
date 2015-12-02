class UserMailer < ApplicationMailer
  default from: 'nnat425@gmail.com'

  def confirmation_email(user, appointment)
    @user = user
    @appointment  = appointment
    mail(to: @user.email, subject: 'You Appointment has been set!')
  end
end
