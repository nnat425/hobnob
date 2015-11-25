class AddPriceToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :student_price, :integer
    add_column :advisors, :regular_price, :integer
  end
end



