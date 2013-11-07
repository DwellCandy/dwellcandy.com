OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '670531322979638', '851c153ee5f8d32d4a2e17c074a081d8'
end