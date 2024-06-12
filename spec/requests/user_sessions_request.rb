require 'rails_helper'

RSpec.describe "User Sessions", type: :request do
  let!(:user) { create(:user, password: 'password', password_confirmation: 'password') }

  describe "POST /login" do
    context "with valid credentials" do
      it "logs in the user and returns a JWT" do
        post '/login', params: { email: user.email, password: 'password' }
        expect(response).to have_http_status(:ok)
        expect(response.cookies['jwt']).to be_present
        expect(response.cookies['auth_status']).to eq('authenticated')
      end
    end

    context "with invalid credentials" do
      it "returns unauthorized status" do
        post '/login', params: { email: user.email, password: 'wrong_password' }
        expect(response).to have_http_status(:unauthorized)
        expect(response.cookies['jwt']).to be_nil
        expect(response.cookies['auth_status']).to be_nil
      end
    end
  end

  describe "DELETE /logout" do
    before do
      post '/login', params: { email: user.email, password: 'password' }
    end

    it "logs out the user and deletes JWT and auth_status cookies" do
      delete '/logout'
      expect(response).to have_http_status(:no_content)
      expect(response.cookies['jwt']).to be_nil
      expect(response.cookies['auth_status']).to be_nil
    end
  end
end
