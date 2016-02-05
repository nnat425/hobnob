class PreviousCompaniesController < ApplicationController

  def index
    @advisor = current_advisor
    render partial: "new_previous_companies"
  end

  def new
    @previous_company = PreviousCompany.new
    if request.xhr?
      render partial: 'new_previous_company_form'
    end
  end

  def create
    @advisor = current_advisor
    created_company = current_advisor.previous_companies.build(previous_company_params)
    if created_company.save
      if request.xhr?
        render partial: "new_previous_companies"
      else
        redirect_to edit_advisor_path(@advisor)
      end
    else
      redirect_to edit_advisor_path(@advisor)
    end
  end


  def edit
    @previous_company = PreviousCompany.find_by(id: params[:id])
    render partial: "edit_previous_company_form"
  end

  def update
    @advisor = current_advisor
    previous_company = PreviousCompany.find_by(id: params[:id])
    if previous_company.save
      previous_company.update(previous_company_params)
      render partial: "new_previous_companies"
    else
      flash[:error] = "Previous Company did not update"
      redirect_to edit_advisor_path(@advisor)
    end
  end

  def destroy
    @previous_company = PreviousCompany.new
    company = PreviousCompany.find_by(id: params[:id])
    current_advisor.previous_companies.delete(company)
    @advisor = current_advisor
    flash[:message] = "Company Deleted"
    if request.xhr?
      render partial: "new_previous_companies"
    else
      redirect_to edit_advisor_path(current_advisor)
    end
  end

  private

  def previous_company_params
    params.require(:previous_company).permit(:name, :job_title, :roles)
  end
end