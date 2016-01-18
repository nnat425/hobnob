class AddCategoryRefToAdvisors < ActiveRecord::Migration
  def change
    add_reference :advisors, :category, index: true, foreign_key: true
  end
end
