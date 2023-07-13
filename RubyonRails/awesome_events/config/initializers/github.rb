Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.credentials.github[:client_id], Rails.application.credentials.github[:client_secret]
  on_failure do |env|
    Web::TopController.action(:oauth_failure).call(env)
  end
end
