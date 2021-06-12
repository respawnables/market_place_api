require 'swagger_helper'

RSpec.describe 'api/v1/tokens', type: :request do

  path '/api/v1/tokens' do

    post('create token') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
