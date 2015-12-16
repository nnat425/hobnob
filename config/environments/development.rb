Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.


  config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => "gmail.com",
      :user_name            => "nnat425@gmail.com",
      :password             => "soccer425",
      :authentication       => :plain,
      :enable_starttls_auto => true
}

##Change password and username to my gmail when testing
##Also have to restart the server locally when testing

  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false


  config.after_initialize do
  ActiveMerchant::Billing::Base.mode = :test
  ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(
  :login => "nnat425-facilitator_api1.gmail.com",
  :password => "W4489B4A67VM7LLW",
  :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31Ac2TI1VnHra3rj5--RCzUAntxx8R"
  )
end

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  config.action_mailer.default_url_options = { :host => "localhost" }

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

#   config.paperclip_defaults = {
#       :storage => :s3,
#       :s3_protocol => 'http',
#       :bucket => ENV['S3_BUCKET_NAME'],
#       :s3_credentials => {
#         :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
#         :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
#         }
#       }
end

Paperclip.options[:command_path] = "/usr/local/bin/"
