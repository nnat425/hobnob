class AddActivationToAdvisors < ActiveRecord::Migration
  def change
   add_column :advisors, :activation_digest, :string
   add_column :advisors, :account_activated, :boolean, default: false
   add_column :advisors, :activated_at, :datetime
   add_column :advisors, :email_verified, :boolean, default: false
 end
end
