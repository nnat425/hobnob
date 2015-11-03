class Advisor < ActiveRecord::Base
  has_many :categories
  validates :firstname, :lastname, :email, :presence => true
  validates :email, uniqueness: true, confirmation: true
  validates :email_confirmation, presence: true
  validates :password, length: { 6..20 }
  has_secure_password
end
