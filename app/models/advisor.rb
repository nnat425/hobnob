class Advisor < ActiveRecord::Base
  belongs_to :category, :dependent => :destroy
  has_many :potential_appointments
  has_many :previous_companies

  validates :email, :presence => true
  validates :email, uniqueness: true


  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_confirmation_of :email, :message => "Should match confirmation"
  validates_presence_of :email_confirmation

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://prepgenie.ie/gamsat/wp-content/uploads/2015/08/default-avatar_man.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]


  attr_accessor :activation_token
  before_create :create_activation_digest


  has_secure_password



def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while Advisor.exists?(column => self[column])
end

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  self.email_confirmation = self.email
  save!
  AdvisorMailer.password_reset(self).deliver
end

def authenticated?(attribute, token)
  digest = send("#{attribute}_digest")
  return false if digest.nil?
  BCrypt::Password.new(digest).is_password?(token)
end

def Advisor.new_token
  SecureRandom.urlsafe_base64
end

def Advisor.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
end

private


def create_activation_digest
  self.activation_token  = Advisor.new_token
  self.activation_digest = Advisor.digest(activation_token)
end


end
