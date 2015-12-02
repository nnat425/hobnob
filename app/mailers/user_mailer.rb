class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email(user)
    @user = user
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'You Appointment has been set!')
  end
end
