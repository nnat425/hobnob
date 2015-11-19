class AddPurchasedAtToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :purchased_at, :time
  end
end
