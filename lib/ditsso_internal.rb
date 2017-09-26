module OmniAuth
  module Strategies
    class DitssoInternal < OmniAuth::Strategies::OAuth2
      option :name, 'ditsso_internal'

      option :client_options,
             site:          ENV['SITE_NAME'],
             authorize_url: 'https://staff-sso-staging.herokuapp.com/o/authorize/',
             token_url: 'https://staff-sso-staging.herokuapp.com/o/token/'

      uid do
        raw_info['id']
      end

      info do
        {
          name: raw_info['name'],
          email: raw_info['email']
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/user/me.json').parsed
      end
    end
  end
end
