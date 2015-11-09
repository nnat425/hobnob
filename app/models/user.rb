class User < ActiveRecord::Base

has_many :carts
has_many :appointments


validates :first_name,:last_name, :email, :presence => true
validates :email, uniqueness: true
validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
validates_confirmation_of :email, :message => "should match email"
validates_presence_of :email_confirmation

has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

has_secure_password



end