class AddAdminVerifiedToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :admin_verified, :boolean, default: false
  end
end
