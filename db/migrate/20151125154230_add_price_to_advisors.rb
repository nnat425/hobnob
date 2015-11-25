class AddPriceToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :price, :integer
  end
end



