Devise.setup do |config|
  require 'devise/orm/active_record'
  config.secret_key = ENV['devise_secret_key'] if Rails.env.production?
  config.mailer_sender = 'Devise Omniauth <hodari@hiddengeniusproject.org>'

  config.mailer = 'Devise::Mailer'
  config.parent_mailer = 'ActionMailer::Base'

  # config.authentication_keys = [ :email ]
  #
  # config.reset_password_keys = [:email ]
  # config.case_insensitive_keys = [ :email, :username ]
  # config.strip_whitespace_keys = [:email, :username ]
  # config.default_scope = :user
  # config.scoped_views = true
  # config.params_authenticatable = true
  # config.http_authentication_realm = 'Application'
  # config.http_authenticatable_on_xhr = true
  # config.http_authenticatable = false
  # config.paranoid = true
  config.skip_session_storage = [:http_auth]
  config.clean_up_csrf_token_on_authentication = true
  config.reload_routes = true

  config.stretches = Rails.env.test? ? 1 : 11

  config.pepper = 'd93ffa1a3085936609a2ce3fcb0b255624d9cd0f89f0e6e92ccbab3b802224cb1705b13d77d9a6f1eaba923881f388bbf4a2df98405206f20464f214fdab4929'
  config.confirm_within = 365.days

  config.remember_for = 4.weeks
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.unlock_strategy = :both


  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  #require 'omniauth-google-oauth2'

  # Rails.application.config.app_middleware.use OmniAuth::Builder do
  #   config.omniauth :google_oauth2,
  #    Figaro.env.google_client_id,
  #    Figaro.env.google_client_secret
  #    #google_oauth2_options
  #     {
  #       scope: 'email, calendar',
  #       prompt: 'select_account',
  #       image_aspect_ratio: 'original',
  #       name: 'google',
  #       access_type: 'offline',
  #       provider_ignores_state: true
  #     }
    #end
   #end
  end

    # Configure the class responsible to send e-mails.


    # Configure the parent class responsible to send e-mails.
    # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in Devise::Mailer,
  # note that it will be overwritten if you use your own mailer class
  # with default "from" parameter.

  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default) and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.

    # ==> Configuration for any authentication mechanism
    # Configure which keys are used when authenticating a user. The default is
    # just :email. You can configure it to use [:username, :subdomain], so for
    # authenticating a user, both parameters are required. Remember that those
    # parameters are used only when authenticating and not when retrieving from
    # session. If you need permissions, you should implement that in a before filter.
    # You can also supply a hash where the value is a boolean determining whether
    # or not authentication should be aborted when the value is not present.

    # Configure parameters from the request object used for authentication. Each entry
    # given should be a request method and it will automatically be passed to the
    # find_for_authentication method and considered in your model lookup. For instance,
    # if you set :request_keys to [:subdomain], :subdomain will be used on authentication.
    # The same considerations mentioned for authentication_keys also apply to request_keys.
    # config.request_keys = []

    # Configure which authentication keys should be case-insensitive.
    # These keys will be downcased upon creating or modifying a user and when used
    # to authenticate or find a user. Default is :email.

    # Configure which authentication keys should have whitespace stripped.
    # These keys will have whitespace before and after removed upon creating or
    # modifying a user and when used to authenticate or find a user. Default is :email.

    # It will change confirmation, password recovery and other workflows
    # to behave the same regardless if the e-mail provided was right or wrong.
    # Does not affect registerable.
    # By default Devise will store the user in session. You can skip storage for
    # particular strategies by setting this option.
    # Notice that if you are skipping storage for all authentication paths, you
    # may want to disable generating routes to Devise's sessions controller by
    # passing skip: :sessions to `devise_for` in your config/routes.rb

    # Tell if authentication through request.params is enabled. True by default.
    # It can be set to an array that will enable params authentication only for the
    # given strategies, for example, `config.params_authenticatable = [:database]` will
    # enable it only for database (email + password) authentication.


    # Tell if authentication through HTTP Auth is enabled. False by default.
    # It can be set to an array that will enable http authentication only for the
    # given strategies, for example, `config.http_authenticatable = [:database]` will
    # enable it only for database authentication. The supported strategies are:
    # :database      = Support basic authentication with authentication key + password


    # If 401 status code should be returned for AJAX requests. True by default.

    # The realm used in Http Basic Authentication. 'Application' by default.
    # By default, Devise cleans up the CSRF token on authentication to
    # avoid CSRF token fixation attacks. This means that, when using AJAX
    # requests for sign in and sign up, you need to get a new CSRF token
    # from the server. You can disable this option at your own risk.

    # When false, Devise will not attempt to reload routes on eager load.
    # This can reduce the time taken to boot the app but if your application
    # requires the Devise mappings to be loaded during boot time the application
    # won't boot properly.


    # ==> Configuration for :database_authenticatable
    # For bcrypt, this is the cost for hashing the password and defaults to 11. If
    # using other algorithms, it sets how many times you want the password to be hashed.
    #
    # Limiting the stretches to just one in testing will increase the performance of
    # your test suite dramatically. However, it is STRONGLY RECOMMENDED to not use
    # a value less than 10 in other environments. Note that, for bcrypt (the default
    # algorithm), the cost increases exponentially with the number of stretches (e.g.
    # a value of 20 is already extremely slow: approx. 60 seconds for 1 calculation).

  # Send a notification email when the user's password is changed
  # config.send_password_change_notification = false

  # ==> Configuration for :confirmable
  # A period that the user is allowed to access the website even without
  # confirming their account. For instance, if set to 2.days, the user will be
  # able to access the website for two days without confirming their account,
  # access will be blocked just in the third day. Default is 0.days, meaning
  # the user cannot access the website without confirming their account.


  # A period that the user is allowed to confirm their account before their
  # token becomes invalid. For example, if set to 3.days, the user can confirm
  # their account within 3 days after the mail was sent, but on the fourth day
  # their account can't be confirmed with the token any more.
  # Default is nil, meaning there is no restriction on how long a user can take
  # before confirming their account.

  # If true, requires any email changes to be confirmed (exactly the same way as
  # initial account confirmation) to be applied. Requires additional unconfirmed_email
  # db field (see migrations). Until confirmed, new email is stored in
  # unconfirmed_email column, and copied to email column on successful confirmation.



  # ==> Configuration for :rememberable
  # The time the user will be remembered without asking for credentials again.

  # Invalidates all the remember me tokens when the user signs out.

  # If true, extends the user's remember period when remembered via cookie.
  # config.extend_remember_period = false

  # Options to be passed to the created cookie. For instance, you can set
  # secure: true in order to force SSL only cookies.
  # config.rememberable_options = {}

    # Email regex used to validate email formats. It simply asserts that
    # one (and only one) @ exists in the given string. This is mainly
    # to give user feedback and not to assert the e-mail validity.
  # ==> Configuration for :validatable
  # Range for password length.

  # ==> Configuration for :timeoutable
  # The time you want to timeout the user session without activity. After this
  # time the user will be asked for credentials again. Default is 30 minutes.
  # config.timeout_in = 30.minutes

  # ==> Configuration for :lockable
  # Defines which strategy will be used to lock an account.
  # :failed_attempts = Locks an account after a number of failed attempts to sign in.
  # :none            = No lock strategy. You should handle locking by yourself.
  # config.lock_strategy = :failed_attempts

  # Defines which key will be used when locking and unlocking an account
  # config.unlock_keys = [:email]

  # Defines which strategy will be used to unlock an account.
  # :email = Sends an unlock link to the user email
  # :time  = Re-enables login after a certain amount of time (see :unlock_in below)
  # :both  = Enables both strategies
  # :none  = No unlock strategy. You should handle unlocking by yourself.

  # Number of authentication tries before locking an account if lock_strategy
  # is failed attempts.
  # config.maximum_attempts = 20

  # Time interval to unlock the account if :time is enabled as unlock_strategy.
  # config.unlock_in = 1.hour
  # Warn on the last attempt before the account is locked.
  # config.last_attempt_warning = true

  # ==> Configuration for :recoverable
  #
  # Defines which key will be used when recovering the password for an account
  # config.reset_password_keys = [:email]

  # Time interval you can reset your password with a reset password key.
  # Don't put a too small interval or your users won't have the time to
  # change their passwords.
  # When set to false, does not sign a user in automatically after their password is
  # reset. Defaults to true, so a user is signed in automatically after a reset.
  # config.sign_in_after_reset_password = true

  # ==> Configuration for :encryptable
  # Allow you to use another hashing or encryption algorithm besides bcrypt (default).
  # You can use :sha1, :sha512 or algorithms from others authentication tools as
  # :clearance_sha1, :authlogic_sha512 (then you should set stretches above to 20
  # for default behavior) and :restful_authentication_sha1 (then you should set
  # stretches to 10, and copy REST_AUTH_SITE_KEY to pepper).
  #
  # Require the `devise-encryptable` gem when using anything other than bcrypt
  # config.encryptor = :sha512

  # ==> Scopes configuration
  # Turn scoped views on. Before rendering "sessions/new", it will first check for
  # "users/sessions/new". It's turned off by default because it's slower if you
  # are using only default views.


  # Configure the default scope given to Warden. By default it's the first
  # devise role declared in your routes (usually :user).

  # Set this configuration to false if you want /users/sign_out to sign out
  # only the current scope. By default, Devise signs out all scopes.
  #config.sign_out_all_scopes = true

  # ==> Navigation configuration
  # Lists the formats that should be treated as navigational. Formats like
  # :html, should redirect to the sign in page when the user does not have
  # access, but formats like :xml or :json, should return 401.
  #
  # If you have any extra navigational formats, like :iphone or :mobile, you
  # should add them to the navigational formats lists.
  #
  # The "*/*" below is required to match Internet Explorer requests.
  # config.navigational_formats = ['*/*', :html]

  # The default HTTP method used to sign out a resource. Default is :delete.


  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.

  #config.provider "KEY", "SECRET"
  # config.provider =
  #         {
  #         google_oauth2: '542001295987-1a2tcq6vm4ndsov68svt3e1379lpetnk.apps.googleusercontent.com',
  #         google_client_secret: 'tDdFW_ZGEoSYyn8o5PpqScGJ',
  #         prompt: "consent",
  #           access_type: "offline",
  #         select_account: true,
  #         scope: 'calendars,maps,email',
  #         image_aspect_ratio: 'square',
  #         image_size: 50
  #         on_failure }
  #         { |env| AuthenticationsController.action(:failure).call(env) }
  #
  #       end

  # ==> Warden configuration
  # If you want to use other strategies, that are not supported by Devise, or
  # change the failure app, you can configure them inside the config.warden block.
  # config.warden do |manager|
  #   config.failure_app = FailureApp
  #end
#   Warden::Manager do |config|
#   config.failure_app = FailureApp
#   config.oauth(:google) do |google|
#     Figaro.env.google_client_id,
#     Figaro.env.google_client_secret
#   end
#   config.default_strategies(:google_oauth2, :password, :other)
# end

  # ==> Mountable engine configurations
  # When using Devise inside an engine, let's call it `MyEngine`, and this engine
  # is mountable, there are some extra configurations to be taken into account.
  # The following options are available, assuming the engine is mounted as:
  #
  #     mount MyEngine, at: '/my_engine'
  #
  # The router that invoked `devise_for`, in the example above, would be:
  # config.router_name = :my_engine

  # When using OmniAuth, Devise cannot automatically set OmniAuth path,
  # so you need to do it manually. For the users scope, it would be:
  # config.omniauth_path_prefix = '/my_engine/users/auth'
  # module OmniAuth
  #   module Strategies
  #     class GoogleAuth < OmniAuth::Strategies::GoogleOauth2
  #       option :name, 'google_auth'
  #       option :callback_path, '/callbacks/google'
  #     end
  #   end
  # end
