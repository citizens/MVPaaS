$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "mvpaas"

# Generate a PEM key for testing
def generate_pem
  OpenSSL::PKey::RSA.generate(2048)
end

# Geneate a JWT for testing
def generate_jwt(pem_key, expiration = nil)
  payload = {
    'sub': 123,
    'username': 'mail@example.com',
    'exp': expiration || Time.now.to_i + 4 * 3600
  }
  JWT.encode(payload, pem_key, 'RS256')
end
