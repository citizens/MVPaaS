require "spec_helper"

RSpec.describe MVPaaS::Auth do
  let(:pem_key) { generate_pem }
  let(:secret)  { pem_key }

  describe ".decode" do
    context 'with a valid token' do
      let(:token) { generate_jwt(pem_key) }

      it 'should return the token data' do
        expect(MVPaaS::Auth.decode(token, secret)).to eq ({ id: 123, email: 'mail@example.com' })
      end
    end

    context 'with an expired token' do
      it 'should raise an error' do
        pending
      end
    end

    context 'with an invalid signature' do
      it 'should raise an error' do
        pending
      end
    end
  end
end
