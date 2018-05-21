require 'rails_helper'


describe OpenHousesController do
  let(:city) { 'Denver' }
  let(:state) { 'CO' }

  describe 'GET open_houses' do
    context 'valid request' do

      it 'returns http status 200' do
        VCR.use_cassette('denver_open_houses', :record => :new_episodes) do
          get 'open_houses', params: { city: city, state: state }
          expect(response.status).to eq 200
        end
      end

      it 'returns json' do
        VCR.use_cassette('denver_open_houses', :record => :new_episodes) do
          get 'open_houses', params: { city: city, state: state }

          body = JSON.parse(response.body)
          expect(body).to have_key "houses"
        end
      end
    end
  end

end
