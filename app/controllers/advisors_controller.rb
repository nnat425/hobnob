class AdvisorsController < ApplicationController

  def index
    @advisors = Advisor.all
    @categories = Category.all.pluck(:name).uniq!
  end

  def new
    @advisor = Advisor.new
  end

  def create
    advisor = Advisor.new(advisor_params)
    if advisor.save && advisor.valid?
      session[:user_or_advisor_id] = advisor.id
      redirect_to edit_advisor_path(advisor)
    else
      flash[:errors] = advisor.errors.full_messages
      redirect_to new_advisor_path
    end
  end

  def show
    @advisor = Advisor.find_by(id: params[:id])
  end

  def edit
    @advisor = Advisor.find_by(id: params[:id])
    @current_categories = @advisor.categories
  end

  def update
    advisor = Advisor.find_by(id: params[:id])
    if advisor_params && params[:category]
      params[:category][:name].each do |category_name|
        advisor.categories.find_or_create_by(name: category_name)
      end
      advisor.update(advisor_params)
      advisor.join_companies(params[:companies])
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
