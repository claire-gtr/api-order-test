require 'rails_helper'

describe 'POST api/routeOrder' do
  it 'renders supplier' do
    params = {
        "id": 2020020005,
        "shipping_country": "ES",
        "lines": [{
            "sku": "acetate-frame-2",
            "quantity": 1,
            "prescription": {
                "type": "single_vision",
                "lens_color": "ATGRDRED01",
                "left": {
                    "SPH": -1
                },
                "right": {
                    "SPH": -1.25
                }
            }
        }]
    }
    post '/api/routeOrder', params: params

    expect(response).to have_http_status(:success)

    expect(response.body.include?({"routing_result": "ATLENS"}.to_json))
  end
end
