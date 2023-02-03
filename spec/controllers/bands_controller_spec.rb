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
        get bands_path(band.id), headers: @header
        json_response = json_exclude_keys(parse_json(response.body)[0])
        band_json = json_exclude_keys(parse_json(band.to_json))
        expect(response).to have_http_status(:ok)
        expect(json_response).to match(band_json)
      end
    end
  end
end
