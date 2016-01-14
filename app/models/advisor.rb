class Advisor < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :potential_appointments

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

  def join_companies(param_companies)
   self.update(other_companies:param_companies.join(","))
 end

 def self.filter(chosen_categories,chosen_locations,chosen_years)
  if chosen_categories
    results_by_category = chosen_categories.map do |chosen_category|
      Category.find_by(name:chosen_category).advisors
    end
    results_by_category = results_by_category.flatten!.uniq!
  else
    results_by_category = all
  end
  if chosen_locations
    results_by_location = chosen_locations.map do |location|
      where(location: location)
    end
    results_by_location = results_by_location.flatten!.uniq!
  else
    results_by_location = all
  end
  if chosen_years
    results_by_year = chosen_years.map do |range|
      where(years_of_experience: range)
    end
    results_by_year = results_by_year.flatten!
  else
    results_by_year = all
  end
  advisor_results = results_by_category & results_by_year
  advisor_results = advisor_results & results_by_location
  advisor_results
end

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

private


def create_activation_digest
  self.activation_token  = Advisor.new_token
  self.activation_digest = Advisor.digest(activation_token)
end


end
