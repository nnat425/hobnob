class DropAdvisorsCategories < ActiveRecord::Migration
  def change
    drop_table :advisors_categories
  end
end


