class AdvisorsController < ApplicationController

  before_action :correct_advisor, only:[:edit, :update]


  def index
    if params[:filter]
      if params[:filter][:category]
        advisors_by_category = Category.find_by(name: params[:filter][:category]).advisors
      else
        advisors_by_category = Advisor.all
      end
      if params[:filter][:location]
        advisors_by_location = params[:filter][:location].map do |location|
          Advisor.where(location: location)
        end
        advisors_by_location.flatten!.uniq!
      else
        advisors_by_location = Advisor.all
      end
      if params[:filter][:years_of_experience]
        advisors_by_years = params[:filter][:years_of_experience].map do |range|
          Advisor.where(years_of_experience: range)
        end
        advisors_by_years.flatten!.uniq!
      else
        advisors_by_years = Advisor.all
      end
      @advisors = advisors_by_category & advisors_by_location & advisors_by_years
      flash[:message] = "Search Results"
    else
      @advisors = Advisor.all
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
    @advisor = Advisor.find_by(id: params[:id])
    @advisor_appointments = @advisor.potential_appointments
  end

  def edit
    @advisor = Advisor.find_by(id: params[:id])
    @current_categories = @advisor.categories
  end

  def update
    advisor = Advisor.find_by(id: params[:id])
    if advisor_params && params[:category]
      advisor.categories = []
      params[:category][:name].each do |category_name|
        advisor.categories << Category.find_or_create_by(name: category_name)
      end
      advisor.update(advisor_params)
      advisor.join_companies(params[:companies])
      if advisor.years_of_experience == '< 5 years'
        advisor.student_price = 25
        advisor.regular_price = 40
      elsif advisor.years_of_experience == '< 5 - 15 years'
        advisor.student_price = 60
        advisor.regular_price = 60
      else
        advisor.student_price = 60
        advisor.regular_price = 75
      end
      advisor.save
      redirect_to advisor_path(advisor)
    else
      flash[:error] = advisor.errors.full_messages
      render :edit
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
    params.require(:advisor).permit(:email, :email_confirmation, :password,:password_confirmation,  :firstname, :lastname, :avatar, :alternative_email, :current_title, :job_description, :charity, :location, :company, :years_of_experience, :other_companies, :education, :certifications, :interesting_facts, :account_activated)
  end


  def correct_advisor
    @advisor = Advisor.find(params[:id])
    redirect_to(root_url) unless @advisor == current_advisor || session[:class_type] == "Admin"
  end

end
