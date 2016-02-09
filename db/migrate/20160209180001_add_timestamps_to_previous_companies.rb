class AddTimestampsToPreviousCompanies < ActiveRecord::Migration
  def change_table
    add_column(:previous_companies, :created_at, :datetime)
    add_column(:previous_companies, :created_at, :datetime)
  end
end
