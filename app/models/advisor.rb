class Advisor < ActiveRecord::Base
  has_many :categories
  validates :email, :presence => true
  validates :email, uniqueness: true
  validates_confirmation_of :password
  validates_confirmation_of :email, :message => "Should match confirmation"
  validates_presence_of :password_confirmation
  has_secure_password

  attr_accessor :alternative_email, :current_title, :job_description, :charity, :location, :company, :years_of_experience, :other_companies, :education, :certifications, :interesting_facts

end
