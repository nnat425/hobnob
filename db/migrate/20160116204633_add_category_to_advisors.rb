class AddCategoryToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :category, :references, null: false
  end
end
