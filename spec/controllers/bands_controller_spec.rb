# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BandsController, type: :request do
  let(:band) { create(:band) }

  describe 'GET /bands' do
    context 'when the request hasnt an authenticathed user' do
      it 'should return unauthorized' do
        get bands_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the request has an authorized user' do
      it 'lists the bands' do
        admin = FactoryBot.create(:user, :admin)
        get bands_path, headers: { 'Authorization' => token(admin) }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET /band/1' do
    context 'when the request has an authorized user' do
      it 'show the band' do
        admin = FactoryBot.create(:user, :admin)
        band = create(:band)
        get bands_path(band.id), headers: { 'Authorization' => token(admin) }
        expect(response).to have_http_status(:ok)
        # need to be improved with https://github.com/collectiveidea/json_spec
        # expect(json_response).to be eql(band_json)
      end
    end
  end
end
