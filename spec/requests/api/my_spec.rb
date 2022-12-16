require 'swagger_helper'

RSpec.describe 'api/my', type: :request do
  # path '/api/my' do
  #   get 'Get my user' do
  #     tags 'My'
  #     consumes 'application/json'
  #     produces 'application/json'
  #     parameter name: :page, in: :query, type: :integer
  #     parameter name: :per_page, in: :query, type: :integer
  #     parameter name: :sort, in: :query, type: :string
  #     parameter name: :filter, in: :query, type: :string
  #     parameter name: :fields, in: :query, type: :string
  #     parameter name: :include, in: :query, type: :string

  #     response '200', 'my user found' do
  #       schema type: :object,
  #         properties: {
  #           data: {
  #             '$ref' => '#/components/schemas/user'
  #           }
  #         },
  #         required: [ 'data' ]

  #       run_test!
  #     end

  #     response '401', 'unauthorized' do
  #       let(:Authorization
end
