class User < ActiveRecord::Base

has_many :carts
has_many :appointments


validates :first_name,:last_name, :email, :presence => true
validates :email, uniqueness: true
validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
validates_confirmation_of :email, :message => "should match email"
validates_presence_of :email_confirmation

has_secure_password



end