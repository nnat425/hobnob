class AddPublishToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :publish, :boolean, default: false
  end
end
