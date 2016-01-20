class PotentialAppointmentsController < ApplicationController


  def create
    date = params[:appointment_date][:date].split('-')
    time = params[:potential_appointment].to_a.flatten
    if date[0] != nil
      start_time = DateTime.new(date[0].to_i,date[1].to_i,date[2].to_i,time[7].to_i,time[9].to_i)
      if current_advisor.category.name == "Resume & Interview Preparation"
        end_time = start_time + 60.minutes
      else
        end_time = start_time + 30.minutes
      end
      potential_appointment = current_advisor.potential_appointments.create!(title:current_advisor.potential_appointments.count + 1,start_time: start_time, end_time: end_time)
      redirect_to advisor_path(current_advisor)
    else
     flash[:pick_date_or_enter_title] = "Please pick a date/Enter a title"
     redirect_to advisor_path(current_advisor)
   end
 end

 def edit
  @potential_appointment = PotentialAppointment.find_by(id: params[:id])
  @advisor_appointments = current_advisor.potential_appointments
end


def update
  potential_appointment = PotentialAppointment.find_by(id: params[:id])
  date = params[:appointment_date][:date].split('-')
  time = params[:potential_appointment].to_a.flatten
  if date[0] != nil
   start_time = DateTime.new(date[0].to_i,date[1].to_i,date[2].to_i,time[7].to_i,time[9].to_i)
   if current_advisor.category.name == "Resume & Interview Preparation"
    end_time = start_time + 60.minutes
  else
    end_time = start_time + 30.minutes
  end
  potential_appointment.update(start_time: start_time, end_time: end_time)
  redirect_to advisor_path(current_advisor)
else
 flash[:pick_date_or_enter_title] = "Please pick a date/Enter a title"
 redirect_to edit_potential_appointment_path(potential_appointment)
end
end

def destroy
  potential_appointment = PotentialAppointment.find_by(id: params[:potential_appointment])
  potential_appointment.destroy
  redirect_to advisor_path(current_advisor)

end



private

def appointment_params
  params.require(:potential_appointment).permit(:start_time,:end_time,:title)
end

end