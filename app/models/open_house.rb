class OpenHouse
  include HTTParty
  class << self

    def find_by_city(city:, state:)
      trulia_url = "https://www.trulia.com/json/search/dots/?id=2&url=https%3A%2F%2Fwww.trulia.com%2Ffor_sale%2F#{city}%2C#{state}%2Fp_oh%2F"
      options = { headers: { "User-Agent" => "Httparty" } }
      build_response(HTTParty.get(trulia_url, options))
    end

    private

    def build_response(res)
      response = {}
      response[:houses] = res['dots']
      response
    end
  end
end
