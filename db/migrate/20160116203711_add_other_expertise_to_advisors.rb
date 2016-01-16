class AddOtherExpertiseToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :other_expertise, :string, default: false
  end
end
