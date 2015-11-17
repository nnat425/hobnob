class CreateAdvisorCategories < ActiveRecord::Migration
  def change
    create_table :advisor_categories do |t|
      t.references :advisor, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
    end
  end
end
