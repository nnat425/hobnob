class AddGeneralCompanyToAdvisors < ActiveRecord::Migration
  def change
      add_column :advisors, :general_company, :string
  end
end
