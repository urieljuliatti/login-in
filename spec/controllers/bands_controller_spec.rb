# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BandsController, type: :request do
  let(:band) { create(:band) }

  before(:each) do
    admin = FactoryBot.create(:user, :admin)
    @header = { 'Authorization' => token(admin) }
  end

  describe 'GET /bands' do
    context 'when the request hasnt an authenticathed user' do
      it 'should return unauthorized' do
        get bands_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the request has an authorized user' do
      it 'lists the bands' do
        get bands_path, headers: @header
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET /band/1' do
    context 'when the request has an authorized user' do
      it 'show the band' do
        band = create(:band)
        get bands_path(band.id), headers: @header
        json_response = JSON.parse(response.body)[0]
        expect(response).to have_http_status(:ok)
        # need to be improved with https://github.com/collectiveidea/json_spec
        # expect(json_response['id']).to be eql(JSON.parse(band.to_json)['id'])
      end
    end
  end
end
