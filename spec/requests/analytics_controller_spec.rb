require 'swagger_helper'

describe 'Analytics API', type: :request, swagger_doc: 'v1/swagger.json' do
  let!(:user) { create :user }
  let!(:Authorization) { auth_headers(user) }

  describe 'Analytics API' do
    path '/v1/analytics/identify_peaks' do
      post 'Identify peaks' do
        security [bearerAuth: []]
        tags 'Analytics'
        operationId 'identify_peaks'
        consumes 'application/json'
        produces 'application/json'

        parameter name: :identify_peaks, in: :body, schema: { '$ref' => '#/definitions/identify_peaks' }

        response '200', 'Successfully returns signal data.' do
          let(:identify_peaks) do
            {
              data: [1, 1.1, 0.9, 1, 1, 1.2, 2.5, 2.3, 2.4, 1.1, 0.8, 1.2, 1],
              threshold: 1
            }
          end

          run_test! do
            expect(json_response["signal"].present?).to be_truthy
            expect(json_response["signal"]).to eq([0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0])
          end
        end

        response '422', 'Returns error response when data array is not sent or threshold is not sent.' do
          let(:identify_peaks) do
            {
              data: nil,
              threshold: 3
            }
          end

          run_test!
        end
      end
    end
  end
end
