class Order < ActiveRecord::Base


  belongs_to :cart
  has_many :transactions, :class_name => "OrderTransaction"

  attr_accessor :card_number, :card_verification

  validate :validate_card, :on => :create

  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, :ip => ip_address, currency: "CAD")
    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    cart.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

  def price_in_cents
    if cart.user.student == true
      return self.cart.total_price_student * 100
    else
    # (cart.total_price*100).round
    return  self.cart.total_price_regular * 100
  end
end

def total_for_student
  total = []
  cart.potential_appointments.each do |appointment|
    if appointment.advisor.category.name == "Resume & Interview Preparation"
      total.push(50)
    else
      total.push(appointment.advisor.student_price)
    end
  end
  return total.reduce(:+)
end

def total_for_regular
  total = []
  cart.potential_appointments.each do |appointment|
    if appointment.advisor.category.name == "Resume & Interview Preparation"
      total.push(60)
    else
      total.push(appointment.advisor.regular_price)
    end
  end
  return total.reduce(:+)
end

private

def validate_card
  unless credit_card.valid?
    credit_card.errors.full_messages.each do |message|
      errors[:base] << message
    end
  end
end

def credit_card
  @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
    :type               => card_type,
    :number             => card_number,
    :verification_value => card_verification,
    :month              => card_expires_on.month,
    :year               => card_expires_on.year,
    :first_name         => first_name,
    :last_name          => last_name
    )
end

end