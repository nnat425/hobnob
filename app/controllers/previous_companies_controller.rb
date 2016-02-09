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
    @advisor = Advisor.find_by(id: params[:advisor_id])
    created_company = @advisor.previous_companies.build(previous_company_params)
    @previous_companies = @advisor.previous_companies.order("created_at")
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
    @advisor = Advisor.find_by(id: params[:advisor_id])
    @previous_company = PreviousCompany.find_by(id: params[:id])
    render partial: "edit_previous_company_form"
  end

  def update
    previous_company = PreviousCompany.find_by(id: params[:id])
    @advisor = previous_company.advisor
    @previous_companies = @advisor.previous_companies.order("created_at")
    if previous_company.save
      previous_company.update(previous_company_params)
      render partial: "new_previous_companies"
    else
      flash[:error] = "Previous Company did not update"
      redirect_to edit_advisor_path(@advisor)
    end
  end

  def destroy
    company = PreviousCompany.find_by(id: params[:id])
    @advisor = company.advisor
    if !company.nil?
      company.destroy
    end
    if request.xhr?
      render partial: "new_previous_companies"
    else
      redirect_to edit_advisor_path(@advisor)
    end
  end

  private

  def previous_company_params
    params.require(:previous_company).permit(:name, :job_title, :roles)
  end
end