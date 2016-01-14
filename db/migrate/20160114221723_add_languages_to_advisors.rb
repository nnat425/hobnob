class AddLanguagesToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :languages, :string
  end
end
