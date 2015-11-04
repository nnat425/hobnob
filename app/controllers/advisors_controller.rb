class AdvisorsController < ApplicationController

  def new
    @advisor = Advisor.new
  end

  def create
    advisor = Advisor.new(advisor_params)
    if advisor.save && advisor.valid?
      session[:user_id] = advisor.id
      redirect_to edit_advisor_path(advisor)
    else
      flash[:error] = advisor.errors.full_messages
      redirect_to new_advisor_path
    end
  end

  def show
    @advisor = Advisor.find_by(id: params[:id])
  end

  def edit
    @advisor = Advisor.find_by(id: params[:id])
  end

  def update
    advisor = Advisor.find_by(id: params[:id])
    if params[:advisor]
      advisor.update_attributes(advisor_params)
      redirect_to advisor_path(advisor)
    else
      flash[:error] = current_user.errors.full_messages
      render :edit
    end
  end

  private

    def advisor_params
      params.require(:advisor).permit(:email, :email_confirmation, :password, :password_confirmation, :firstname, :lastname, :alternative_email, :current_title, :job_description, :charity, :location, :company, :years_of_experience, :other_companies, :education, :certifications, :interesting_facts)
    end


end
