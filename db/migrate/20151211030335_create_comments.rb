class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author, null: false
      t.string :body, null: false
      t.string :subtext

      t.timestamps null: false
    end
  end
end
