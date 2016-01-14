class AddActivationToUsers < ActiveRecord::Migration
 def change
  add_column :users, :activation_digest, :string
  add_column :users, :account_activated, :boolean, default: false
  add_column :users, :activated_at, :datetime
end
end

