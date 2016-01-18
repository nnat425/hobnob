class AddOtherExpertiseToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :other_expertise, :string
  end
end
