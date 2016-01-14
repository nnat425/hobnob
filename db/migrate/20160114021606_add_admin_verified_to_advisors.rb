class AddAdminVerifiedToAdvisors < ActiveRecord::Migration
  def change
    add_column :users, :admin_verified, :boolean, default: false
  end
end
