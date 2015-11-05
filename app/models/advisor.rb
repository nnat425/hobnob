class Advisor < ActiveRecord::Base
  has_many :categories

  validates :email, :presence => true
  validates :email, uniqueness: true

validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_confirmation_of :email, :message => "Should match confirmation"
  validates_presence_of :email_confirmation

  has_secure_password

end
