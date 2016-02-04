class AdvisorsController < ApplicationController

  before_action :correct_advisor, only:[:edit, :update]


  def index
    if params[:filter]
      if params[:filter][:category]
        advisors_by_category = params[:filter][:category].map do |category|
          Category.find_by(name: category).advisors.where("account_activated = ? AND publish = ?", true, true)
        end
        advisors_by_category.flatten!
      else
        advisors_by_category = Advisor.where("account_activated = ? AND publish = ?", true, true)
      end
      if params[:filter][:location]
        advisors_by_location = params[:filter][:location].map do |location|
          Advisor.where("account_activated = ? AND publish = ? AND location = ?", true, true, location)
        end
        advisors_by_location.flatten!.uniq!
      else
        advisors_by_location = Advisor.where("account_activated = ? AND publish = ?", true, true)
      end
      if params[:filter][:years_of_experience]
        advisors_by_years = params[:filter][:years_of_experience].map do |range|
          Advisor.where("account_activated = ? AND publish = ? AND years_of_experience = ?", true, true, range)
        end
        advisors_by_years.flatten!.uniq!
      else
        advisors_by_years = Advisor.where("account_activated = ? AND publish = ?", true, true)
      end
      @advisors = advisors_by_category & advisors_by_location & advisors_by_years
      flash[:message] = "Search Results"
    else
      @advisors = Advisor.where("account_activated = ? AND publish = ?", true, true)
    end
  end



  def new
    @advisor = Advisor.new
  end

  def create
    advisor = Advisor.new(advisor_params)
    if advisor.save && advisor.valid?
      session[:user_or_advisor_id] = advisor.id
      session[:class_type] = advisor.class.name
      AdvisorMailer.email_verification(advisor).deliver_now
      flash[:thank_you] = "Thank you!"
      redirect_to edit_advisor_path(advisor)
    else
      flash[:errors] = advisor.errors.full_messages
      redirect_to advisor_new_path
    end
  end

  def show
    if logged_in? || admin_logged_in?
      advisor = Advisor.find_by(id: params[:id])
      if (advisor.publish == true && advisor.account_activated == true) || (current_advisor == advisor) || admin_logged_in?
        @advisor = advisor
        advisor_appointments = @advisor.potential_appointments
        @advisor_appointments = advisor_appointments.sort_by { |appointment| appointment.start_time.strftime("%b,%d") }
        @potential_appointment = PotentialAppointment.new
      else
        render :inactivated_advisor
      end
    else
      flash[:message] = "Please Login or Signup to "
      redirect_to login_path
    end
  end

  def edit
    @advisor = Advisor.find_by(id: params[:id])
    @previous_company = PreviousCompany.new
  end

  def update
    advisor = Advisor.find_by(id: params[:id])
    if params[:other_expertise]
      other_categories = []
      params[:other_expertise].each do |category_name|
        other_categories << category_name
      end
      advisor.other_expertise = other_categories.join(", ")
    end
    advisor.category = Category.find_or_create_by(name: params[:category][:name])
    advisor.update(advisor_params)
    if params[:category][:name] == "Resume & Interview Preparation"
      advisor.student_price = 50
      advisor.regular_price = 60
    else
      if advisor.years_of_experience == '< 5 years'
        advisor.student_price = 30
        advisor.regular_price = 40
      elsif advisor.years_of_experience == '5 - 15 years'
        advisor.student_price = 30
        advisor.regular_price = 40
      else
        advisor.student_price = 50
        advisor.regular_price = 60
      end
    end
    if advisor.save
      redirect_to advisor_path(advisor)
    else
      flash[:error] = advisor.errors.full_messages
      redirect_to edit_advisor_path(current_advisor)
    end
  end

  def activate
    advisor = Advisor.find_by(id: params[:id])
    advisor.update(account_activated: true, email_confirmation: advisor.email)
    redirect_to network_members_path
  end

   def de_activate
    advisor = Advisor.find_by(id: params[:id])
    advisor.update(account_activated: false, email_confirmation: advisor.email)
    redirect_to network_members_path
  end


  def destroy
    advisor = Advisor.find_by(id: params[:id])
    advisor.destroy
    redirect_to network_members_path
  end

  private

  def advisor_params
    params.require(:advisor).permit(:email, :email_confirmation, :password,:password_confirmation,  :firstname, :lastname, :avatar, :alternative_email, :current_title, :job_description, :charity, :charity_url, :languages, :publish, :location, :company, :years_of_experience, :other_companies, :education, :certifications, :interesting_facts, :account_activated, :general_company, :other_expertise, :phone_number)
  end


  def correct_advisor
    @advisor = Advisor.find(params[:id])
    redirect_to(root_url) unless @advisor == current_advisor || session[:class_type] == "Admin"
  end

end
