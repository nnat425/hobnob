class AdvisorsController < ApplicationController

  def new
    @advisor = Advisor.new
  end

end
