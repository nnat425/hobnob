class AddCategoriesToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors,:categories, :string, array: true
  end
end
