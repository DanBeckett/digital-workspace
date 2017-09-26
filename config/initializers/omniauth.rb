require 'ditsso_internal'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider 'ditsso_internal',
           ENV['DIT_SSO_INTERNAL_CLIENT_ID'],
           ENV['DIT_SSO_INTERNAL_CLIENT_SECRET']
end
