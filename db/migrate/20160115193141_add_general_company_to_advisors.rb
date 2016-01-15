class AddGeneralCompanyToAdvisors < ActiveRecord::Migration
  def change
      add_column :advisors, :general_company, :string, default: false
  end
end
