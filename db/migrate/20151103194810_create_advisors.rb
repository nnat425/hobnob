class CreateAdvisors < ActiveRecord::Migration
  def change
    create_table :advisors do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.attachment :avatar
      t.string :current_title
      t.string :job_description
      t.string :charity
      t.string :location
      t.string :alternative_email
      t.string :company
      t.integer :years_of_experience
      t.string :other_companies
      t.string :education
      t.string :certifications
      t.string :interesting_facts

      t.timestamps null:false
    end
  end
end
