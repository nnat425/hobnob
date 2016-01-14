class AddActivationToAdvisors < ActiveRecord::Migration
  def change
   add_column :advisors, :activation_digest, :string
   add_column :advisors, :activated, :boolean, default: false
   add_column :advisors, :activated_at, :datetime
 end
end
