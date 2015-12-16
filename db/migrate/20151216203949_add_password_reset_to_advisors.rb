class AddPasswordResetToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :password_reset_token, :string
    add_column :advisors, :password_reset_sent_at, :datetime
  end
end
