class AddAttachmentAvatarToAdvisors < ActiveRecord::Migration
  def self.up
    change_table :advisors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :advisors, :avatar
  end
end
