class User < ActiveRecord::Base

  has_many :carts
  has_many :potential_appointments


  validates :first_name,:last_name, :email, :presence => true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_confirmation_of :email, :message => "should match email"
  validates_presence_of :email_confirmation

  has_secure_password

  after_save :create_cart

  def create_cart
    self.carts.create
  end

  def booked_appointments
    booked_appointment = []
    self.carts.each do |cart|
      booked_appointment.push(cart.potential_appointments.where(booked_status?: true ))
    end
    return booked_appointment.flatten
  end


  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    self.email_confirmation = self.email
    save!
    UserMailer.password_reset(self).deliver
  end


end