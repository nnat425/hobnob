class Advisor < ActiveRecord::Base
  has_many :categories
  validates :email, :presence => true
  validates :email, uniqueness: true
  validates_confirmation_of :password
  validates_confirmation_of :email, :message => "Should match confirmation"
  validates_presence_of :password_confirmation
  has_secure_password
end
