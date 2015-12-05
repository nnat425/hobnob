class AdvisorsController < ApplicationController

  def index
    if params[:filter]
      @advisors = Advisor.filter(params[:filter][:category],params[:filter][:years_of_experience])
      if request.xhr?
        render partial: "results_index", layout: false
      end
    else
      @advisors = Advisor.all
      if request.xhr?
        render partial: "results_index", layout: false
      end
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
      redirect_to edit_advisor_path(advisor)
    else
      flash[:errors] = advisor.errors.full_messages
      redirect_to new_advisor_path
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

  private

    def advisor_params
      params.require(:advisor).permit(:email, :email_confirmation, :password,:password_confirmation,  :firstname, :lastname, :avatar, :alternative_email, :current_title, :job_description, :charity, :location, :company, :years_of_experience, :other_companies, :education, :certifications, :interesting_facts)
    end

end
