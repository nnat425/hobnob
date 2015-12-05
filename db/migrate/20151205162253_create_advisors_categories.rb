class CreateAdvisorsCategories < ActiveRecord::Migration
  def change
    create_table :advisors_categories do |t|
      t.references :advisor, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
