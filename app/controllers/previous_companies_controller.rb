class PreviousCompaniesController < ApplicationController
  def new
    @previous_company = PreviousCompany.new
    if request.xhr?
      render partial: 'new_previous_company_form'
    end
  end
end