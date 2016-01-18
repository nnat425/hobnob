class PotentialAppointmentsController < ApplicationController


  def create

    date = params[:appointment_date][:date].split('-')
    if date[0] != nil && params[:potential_appointment][:title] != ""

      start_time = Time.new(date[0],date[1],date[2],params[:potential_appointment].values[4].to_i,params[:potential_appointment].values[5].to_i).to_s

      end_time = Time.new(date[0],date[1],date[2],params[:potential_appointment].values[9].to_i,params[:potential_appointment].values[10].to_i).to_s

      potential_appointment = current_advisor.potential_appointments.create(title: params[:potential_appointment][:title],start_time: start_time, end_time: end_time)

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
  if date[0] != nil && params[:potential_appointment][:title] != ""

    start_time = Time.new(date[0],date[1],date[2],params[:potential_appointment].values[4].to_i,params[:potential_appointment].values[5].to_i).to_s

    end_time = Time.new(date[0],date[1],date[2],params[:potential_appointment].values[9].to_i,params[:potential_appointment].values[10].to_i).to_s

    potential_appointment.update(title: params[:potential_appointment][:title],start_time: start_time, end_time: end_time)

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