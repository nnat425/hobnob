class AddCharityUrlToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :charity_url, :string
  end
end
