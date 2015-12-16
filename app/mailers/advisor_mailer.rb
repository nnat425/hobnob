class AdvisorMailer < ApplicationMailer

 def confirmation_email(user, appointment)
    @user = user
    @appointment  = appointment
    @advisor = Advisor.find_by(id: appointment.advisor_id)
    mail(to: @advisor.email, subject: 'Hobnob:An appointment has been booked!')
  end

  def password_reset(advisor)
    @advisor = advisor
    mail :to => advisor.email, :subject => "Password Reset"
  end

end
