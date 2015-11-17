class RemoveAdvisorFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :advisor, :references
  end
end
