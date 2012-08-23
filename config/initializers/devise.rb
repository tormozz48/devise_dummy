# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.mailer_sender = "tormozoid48@gmail.com"

  require 'devise/orm/active_record'
  # config.authentication_keys = [ :email ]
  # config.request_keys = []

  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]

  # config.params_authenticatable = true
  # config.http_authenticatable = false
  # config.http_authenticatable_on_xhr = true
  # config.http_authentication_realm = "Application"
  # config.paranoid = true

  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10

  # config.pepper = "1723fef8348b82c9bfa504d8fde492b4c318a0c8e8c85ac96ed1e5fcea81adad31c00dab5a9d923c71ab8c0d55c57b415b3c0055be4e12b376efce4ac85100a1"
  # config.allow_unconfirmed_access_for = 2.days
  config.reconfirmable = true

  # config.confirmation_keys = [ :email ]
  # config.remember_for = 2.weeks
  # config.extend_remember_period = false
  # config.rememberable_options = {}
  # config.password_length = 6..128
  # config.email_regexp = /\A[^@]+@[^@]+\z/
  # config.timeout_in = 30.minutes
  # config.expire_auth_token_on_timeout = false
  # config.lock_strategy = :failed_attempts
  # config.unlock_keys = [ :email ]

  # Defines which strategy will be used to unlock an account.
  # :email = Sends an unlock link to the user email
  # :time  = Re-enables login after a certain amount of time (see :unlock_in below)
  # :both  = Enables both strategies
  # :none  = No unlock strategy. You should handle unlocking by yourself.
  # config.unlock_strategy = :both
  # config.maximum_attempts = 20
  # config.unlock_in = 1.hour
  # config.reset_password_keys = [ :email ]
  config.reset_password_within = 6.hours

  # config.encryptor = :sha512
  # config.token_authentication_key = :auth_token
  # config.scoped_views = false
  # config.default_scope = :user
  # config.sign_out_all_scopes = true
  # config.navigational_formats = ["*/*", :html]

  config.sign_out_via = :delete

  # config.router_name = :my_engine
  # config.omniauth_path_prefix = "/my_engine/users/auth"

  #config.omniauth :facebook, "136087493200583", "c24e83e6fa9049e872019f2a047e9e8f", :strategy_class => OmniAuth::Strategies::Facebook, :client_options => {:ssl => {:ca_path => '#{Rails.root}/config'}}
  config.omniauth :facebook, "136087493200583", "c24e83e6fa9049e872019f2a047e9e8f", :strategy_class => OmniAuth::Strategies::Facebook
  config.omniauth :twitter, "JxgPPjdJyj8Z9UkHPaM6w", "BaHbQcQp3pTsy3QGiqZVfj6h8260fecpfTFG7Qwk50"
  config.omniauth :vkontakte, "3087304", "DZEujcI61tTdcfJYnSoS"
  #config.omniauth :google_oauth2, 111, "111", :name => 'google'

end