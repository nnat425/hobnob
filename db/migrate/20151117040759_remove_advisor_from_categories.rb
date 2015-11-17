class RemoveAdvisorFromCategories < ActiveRecord::Migration
  def change
    remove_reference :categories, :advisor
  end
end
