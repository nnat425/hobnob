class User < ActiveRecord::Base

has_many :carts
has_many :appointments


validates :first_name,:last_name, :presence => true

validates :email, uniqueness: true
validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

validates :password, confirmation: true


has_secure_password



end