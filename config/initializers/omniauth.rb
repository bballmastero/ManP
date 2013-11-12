OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['688246237861973'], ENV['24e1455fef531a73d28f556ed020090e']
end