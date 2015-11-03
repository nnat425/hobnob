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
      @errors = user.errors.full_messages
      render "new"
    end
  end


end
