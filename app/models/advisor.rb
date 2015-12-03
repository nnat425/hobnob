class Advisor < ActiveRecord::Base
  has_many :potential_appointments

  validates :email, :presence => true
  validates :email, uniqueness: true


  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_confirmation_of :email, :message => "Should match confirmation"
  validates_presence_of :email_confirmation

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://prepgenie.ie/gamsat/wp-content/uploads/2015/08/default-avatar_man.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

  has_secure_password

  def join_companies(param_companies)
     self.update(other_companies:param_companies.join(","))
  end

  def self.filter(chosen_categories,chosen_years)
    if chosen_categories
      results_by_category = chosen_categories.map do |chosen_category|
        Category.find_by(name: chosen_category).advisors
      end
      results_by_category.flatten!.uniq!
    else
      results_by_category = all
    end
    if chosen_years
      results_by_year = chosen_years.map do |range|
        where(years_of_experience: range)
      end
      results_by_year.flatten!
      advisor_results = results_by_category & results_by_year
    else
      advisor_results = results_by_category
    end
    advisor_results
  end
end
