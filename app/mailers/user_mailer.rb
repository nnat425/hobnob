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

  def receipt(user)
    @user = user
    attachments['show.pdf'] = WickedPdf.new.pdf_from_string(
      render_to_string(:pdf => 'file_name', :template => 'orders/show.pdf.erb', :layout => 'pdf.html.erb'))
    mail :to => user.email, :subject => "Hobnob order receipt"
  end

end
