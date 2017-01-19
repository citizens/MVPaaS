require "spec_helper"

RSpec.describe MVPaaS::Auth do
  let(:pem_key) { generate_pem }
  let(:other_pem_key) { Base64.urlsafe_encode64(generate_pem.to_s) }
  let(:secret)  { Base64.urlsafe_encode64(pem_key.to_s) }
  let(:token) { generate_jwt(pem_key) }

  describe ".decode" do
    context 'with a valid token' do
      it 'should return the token data' do
        expect(MVPaaS::Auth.decode(token, secret)).to eq ({ id: 123, email: 'mail@example.com' })
      end
    end

    context 'with an expired token' do
      let(:token) { generate_jwt(pem_key, Time.now - 1000) }
      it 'should raise an error' do
        expect { MVPaaS::Auth.decode(token, secret) }.to raise_error(JWT::ExpiredSignature)
      end
    end

    context 'with an invalid signature' do
      it 'should raise an error' do
        expect { MVPaaS::Auth.decode(token, other_pem_key) }.to raise_error(JWT::VerificationError)
      end
    end
  end
end
