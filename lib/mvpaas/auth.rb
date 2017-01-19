require 'jwt'
require 'openssl'
require 'base64'

module MVPaaS
  module Auth

    module_function

    def decode(token, secret = nil)
      decoded_secret = Base64.urlsafe_decode64(secret || ENV['MVPAAS_SECRET'])
      rsa_key = OpenSSL::PKey::RSA.new(decoded_secret,'').public_key
      decoded_jwt = JWT.decode(token, rsa_key, true, algorithm: 'RS256')[0]
      {
        id: decoded_jwt['sub'],
        email: decoded_jwt['username'],
      }
    end
  end
end
