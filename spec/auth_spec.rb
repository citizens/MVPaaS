require "spec_helper"

RSpec.describe MVPaaS::Auth do
  let(:token)   { '' }
  let(:secret)  { '' }

  describe ".decode" do
    context 'with a valid token' do
      it 'should return the token data' do
        pending
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
