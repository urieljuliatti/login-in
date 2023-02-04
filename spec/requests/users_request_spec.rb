# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /login' do
    context 'when the request hasnt an authenticathed user' do
      it 'should return unauthorized' do
        post login_path
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when the request has an authorized user' do
      let(:user) { create(:user) }

      before do
        allow(user).to receive(:authenticate).with(user.password).and_return(true)
      end

      it 'logs in the user' do
        post login_path, params: { username: 'urielvalle', password: '12345' }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET index/' do
    before(:each) do
      @admin = create(:user, :admin)
      @header = { 'Authorization' => token(@admin) }
    end

    context 'when the request hasnt an authenticathed user' do
      it 'should return unauthorized' do
        get users_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the request has an authorized user' do
      it 'lists the users' do
        get users_path, headers: @header
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
