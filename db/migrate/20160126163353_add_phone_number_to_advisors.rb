class AddPhoneNumberToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :phone_number, :string
  end
end
