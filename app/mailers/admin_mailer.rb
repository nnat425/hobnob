class AdminMailer < ApplicationMailer

def confirmation_email(user, appointment)
    @user = user
    @appointment  = appointment
    @advisor = Advisor.find_by(id: appointment.advisor_id)
    mail(to: 'nnat425@gmail.com', subject: 'Hobnob:Appointment #' + @appointment.id.to_s +" has been booked!")
  end

end
