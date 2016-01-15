class AdminMailer < ApplicationMailer

def confirmation_email(user, appointment)
    @user = user
    @appointment  = appointment
    @advisor = Advisor.find_by(id: appointment.advisor_id)
    mail(to: 'karen@thepelikangroup.com', subject: "Hobnob:Appointment # #{@appointment.id} has been booked!")
  end

end
