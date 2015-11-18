class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @advisors = @category.advisors
  end

end