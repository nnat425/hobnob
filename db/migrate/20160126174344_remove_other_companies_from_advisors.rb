class RemoveOtherCompaniesFromAdvisors < ActiveRecord::Migration
  def change
    remove_column :advisors, :other_companies, :string
  end
end
