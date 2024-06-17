# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe "User Creation", type: :request do
  describe "POST /users" do
    context "with valid parameters" do
      it "creates a new user" do
        expect {
          post '/users', params: {
            user: {
              username: 'testuser',
              email: 'test@example.com',
              password: 'password',
              password_confirmation: 'password'
            }
          }
        }.to change(User, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new user" do
        expect {
          post '/users', params: {
            user: {
              username: '',
              email: 'test@example.com',
              password: 'password',
              password_confirmation: 'password'
            }
          }
        }.to change(User, :count).by(0)
        expect(response).to have_http_status(422)
      end
    end
  end
end
