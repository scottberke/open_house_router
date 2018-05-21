require 'rails_helper'

describe OpenHouse do
  let(:open_house) { OpenHouse }

  subject { open_house }

  it { is_expected.to respond_to :find_by_city }

  describe '.find_by_city' do
    let(:city) { 'Denver' }
    let(:state) { 'CO' }
    it "should require a city and state" do
      expect { OpenHouse.find_by_city() }.to raise_error(ArgumentError)
    end

    it "should require a city" do
      expect { OpenHouse.find_by_city(state: state) }.to raise_error(ArgumentError)
    end

    it "should require a state" do
      expect { OpenHouse.find_by_city(city: city) }.to raise_error(ArgumentError)
    end

    it "should return open houses" do
      VCR.use_cassette('denver_open_houses', :record => :new_episodes) do
        results = OpenHouse.find_by_city(city: city, state: state)

        expect(results).to be_a Hash
        expect(results).to have_key(:houses)
      end
    end
  end
end
