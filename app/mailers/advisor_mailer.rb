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

def signup_confirmation(advisor)
  @advisor = advisor
  mail :to => advisor.email, :subject => "Welcome to Hobnob"
end

def email_verification(advisor)
  @advisor = advisor
  mail(:to => advisor.email, :subject => "Welcome to the Hob Nob Network",
       :bcc => "nnat@umass.edu")
end

end
