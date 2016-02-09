class AddMissingTimestamps < ActiveRecord::Migration
  def change
    add_timestamps :admins
    add_timestamps :orders
    add_timestamps :previous_companies
  end
end