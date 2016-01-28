class PreviousCompaniesController < ApplicationController

  def index
    render partial: "new_previous_company"
  end

  def new
    @previous_company = PreviousCompany.new
    if request.xhr?
      render partial: 'new_previous_company_form'
    end
  end

  def create
    @advisor = current_advisor
    @new_company = current_advisor.previous_companies.create(previous_company_params)
    if request.xhr?
      render partial: "new_previous_company"
    else
      render :"advisors/edit"
    end
    # respond_to do |fmt|
    #   fmt.html { render :"advisors/edit" }
    #   fmt.json { render partial: "new_previous_company" }
    # end
  end

  private

  def previous_company_params
    params.require(:previous_company).permit(:name, :job_title, :roles)
  end
end