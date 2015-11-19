
ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Billing::PaypalGateway.new(
  :login => "nnat425_api1.gmail.com",
  :password => "E4K9VB34SAMURQMR",
  :signature => "Apr.MwRNY2TvVsOaij7C8HWIfcBHAgVvHCQ9DqHIUyhoEe-KLIYKk3sr"
  )

@credit_card ||= ActiveMerchant::Billing::CreditCard.new(
  :type               => card_type,
  :number             => card_number,
  :verification_value => card_verification,
  :month              => card_expires_on.month,
  :year               => card_expires_on.year,
  :first_name         => first_name,
  :last_name          => last_name
  )