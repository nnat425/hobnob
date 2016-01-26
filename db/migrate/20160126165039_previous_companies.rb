class PreviousCompanies < ActiveRecord::Migration
  def change
    create_table :previous_companies do |t|
      t.references :advisor
      t.string :name
      t.string :job_title
      t.string :roles
    end
  end
end
