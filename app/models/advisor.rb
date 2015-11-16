class Advisor < ActiveRecord::Base
  has_many :categories
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

  def add_categories(params)
    if self.categories.length != 0
      self.categories.each {|category| category.destroy}
    end
    params.each do |category|
      added_category = Category.create(name:category,advisor_id: self.id)
    end
  end

  def join_companies(param_companies)
     self.update(other_companies:param_companies.join(","))
  end

end
