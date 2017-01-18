require 'jwt'
require 'openssl'

module MVPaaS
  module Auth

    module_function

    def decode(token, secret)
      rsa_key = OpenSSL::PKey::RSA.new(secret,'').public_key
      decoded_jwt = JWT.decode(token, rsa_key, true, algorithm: 'RS256')[0]
      {
        id: decoded_jwt['sub'],
        email: decoded_jwt['username'],
      }
    end
  end
end
