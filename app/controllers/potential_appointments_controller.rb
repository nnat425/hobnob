class PotentialAppointmentsController < ApplicationController


  def create
    advisor  = Advisor.find_by(id: params[:potential_appointment][:advisor_id])
    date = params[:appointment_date][:date].split('-')
    time = params[:potential_appointment].to_a.flatten
    if date[0] != nil
      start_time = DateTime.new(date[0].to_i,date[1].to_i,date[2].to_i,time[7].to_i,time[9].to_i)
      if advisor.category.name == "Resume & Interview Preparation"
        end_time = start_time + 60.minutes
      else
        end_time = start_time + 30.minutes
      end
      potential_appointment = advisor.potential_appointments.create!(title: advisor.category.name,start_time: start_time, end_time: end_time)
      redirect_to advisor_path(advisor)
    else
     flash[:pick_date_or_enter_title] = "Please pick a date/Enter a title"
     redirect_to advisor_path(advisor)
   end
 end

 def edit
  @potential_appointment = PotentialAppointment.find_by(id: params[:id])
  advisor = Advisor.find_by(id: @potential_appointment.advisor.id)
  @advisor_appointments = advisor.potential_appointments
end


def update
  potential_appointment = PotentialAppointment.find_by(id: params[:id])
  advisor = potential_appointment.advisor
  date = params[:appointment_date][:date].split('-')
  time = params[:potential_appointment].to_a.flatten
  if date[0] != nil
   start_time = DateTime.new(date[0].to_i,date[1].to_i,date[2].to_i,time[7].to_i,time[9].to_i)
   if advisor.category.name == "Resume & Interview Preparation"
    end_time = start_time + 60.minutes
  else
    end_time = start_time + 30.minutes
  end
  potential_appointment.update(start_time: start_time, end_time: end_time)
  redirect_to advisor_path(advisor)
else
 flash[:pick_date_or_enter_title] = "Please pick a date/Enter a title"
 redirect_to edit_potential_appointment_path(potential_appointment)
end
end

def destroy
  potential_appointment = PotentialAppointment.find_by(id: params[:potential_appointment])
  advisor = potential_appointment.advisor
  potential_appointment.destroy
  redirect_to advisor_path(advisor)

end



private

def appointment_params
  params.require(:potential_appointment).permit(:start_time,:end_time,:title)
end

end