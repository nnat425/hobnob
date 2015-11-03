class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name , null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :student, default: false
      t.string :school
      t.string :program
      t.integer :graduation_date

      t.timestamps null: false

    end
  end
end
