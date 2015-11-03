class AdvisorsController < ApplicationController

  def new
    @advisor = Advisor.new
  end

  def create
    advisor = Advisor.new(advisor_params)
    if advisor.save && advisor.valid?
      session[:user_id] = advisor.id
      redirect_to advisor_path(advisor)
    else
      flash[:error] = advisor.errors.full_messages
      redirect_to new_advisor_path
    end
  end

  private

    def advisor_params
      params.require(:advisor).permit(:firstname, :lastname, :email, :password)
    end


end
