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

  def signup_confirmation(user)
    @user = user
    mail :to => user.email, :subject => "Welcome to Hobnob"
  end

  def email_verification(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to the Hob Nob",
     :bcc => "karen@thepelikangroup.com")
  end

  def receipt(current_user, order_id, appointments)
    @appointments = appointments
    @current_user = current_user
    @order = Order.find(order_id)
    attachments['show.pdf'] = WickedPdf.new.pdf_from_string(
      render_to_string(:pdf => 'file_name', :template => 'orders/show.pdf.erb', :layout => 'pdf.html.erb'))
    mail :to => current_user.email, :subject => "Hobnob order receipt"
  end

end
