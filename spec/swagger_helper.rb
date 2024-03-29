# frozen_string_literal: true

require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.json' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      components: {
        securitySchemes: {
          bearerAuth: {
            type: 'http',
            scheme: 'bearer',
            bearerFormat: 'JWT'
          }
        }
      },
      paths: {},
      definitions: {
        sign_in: {
          type: :object,
          properties: {
            email: { type: :string },
            password: { type: :string }
          },
          example: {
            user: {
              email: "user_1@abc.com" ,
              password: "password"
            }
          }
        },
        sign_up: {
          type: :object,
          properties: {
            email: { type: :string },
            password: { type: :string }
          },
          example: {
            user: {
              email: "john@abc.com" ,
              password: "password"
            }
          }
        },
        identify_peaks: {
          type: :object,
          properties: {
            data: { type: :array },
            threshold: { type: :integer }
          },
          example: {
            data: [1, 1.1, 0.9, 1, 1, 1.2, 2.5, 2.3, 2.4, 1.1, 0.8, 1.2, 1],
            threshold: 1
          },
        }
      },
      securityDefinitions: {
        bearerAuth: {
          type: 'apiKey',
          scheme: 'bearer',
          bearerFormat: 'JWT',
          in: 'header',
          description: 'JWT Authorization header using the Bearer scheme. Example: Authorization: Bearer {token}',
          name: 'Authorization'
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :json
end
