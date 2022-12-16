require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do
  # path '/api/comments' do
  #   get 'Get all comments' do
  #     tags 'Comments'
  #     consumes 'application/json'
  #     produces 'application/json'
  #     parameter name: :page, in: :query, type: :integer
  #     parameter name: :per_page, in: :query, type: :integer
  #     parameter name: :sort, in: :query, type: :string
  #     parameter name: :filter, in: :query, type: :string
  #     parameter name: :fields, in: :query, type: :string
  #     parameter name: :include, in: :query, type: :string

  #     response '200', 'comments found' do
  #       schema type: :object,
  #         properties: {
  #           data: {
  #             type: :array,
  #             items: {
  #               '$ref' => '#/components/schemas/comment'
  #             }
  #           }
  #         },
  #         required: [ 'data' ]

  #       run_test!
  #     end

  #     response '401', 'unauthorized' do
  #       let(:Authorization
end
