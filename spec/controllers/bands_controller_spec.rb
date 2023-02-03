# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BandsController, type: :request do
  let(:band) { create(:band) }

  before(:each) do
    @admin = FactoryBot.create(:user, :admin)
    @header = { 'Authorization' => token(@admin) }
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
    context 'when gets the band' do
      it 'shows the band' do
        get bands_path(band.id), headers: @header
        json_response = json_exclude_keys(parse_json(response.body)[0])
        band_json = json_exclude_keys(parse_json(band.to_json))
        expect(response).to have_http_status(:ok)
        expect(json_response).to match(band_json)
      end
    end
  end

  describe 'POST /band/1' do
    context 'when the band is valid' do
      it 'creates a band' do
        post bands_path, params: { band: attributes_for(:band) }, headers: @header
        expect(response).to have_http_status(:created)
      end
      it 'increments a Band by one' do
        expect {
          post bands_path, params: { band: attributes_for(:band) }, headers: @header
        }.to change(Band, :count).by 1
      end
    end
    context 'when the band name is invalid' do
      it 'renders unprocessable entity' do
        post bands_path, params: { band: attributes_for(:band, :invalid) }, headers: @header
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /band/1' do
    context 'when updates the band' do
      it 'updates the band' do
        new_band = attributes_for(:band)
        band = @admin.bands.create(new_band)
        put band_path(band), params: { band: attributes_for(:band, :sodom) }, headers: @header
        json_response = json_exclude_keys(parse_json(response.body))
        expect(response).to have_http_status(:ok)
        expect(json_response['name']).to match(/Sodom/)
      end
    end
  end
end
