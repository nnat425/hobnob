class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.string :subtext
      t.boolean :charity, default: false, null: false

      t.timestamps null: false
    end
  end
end
