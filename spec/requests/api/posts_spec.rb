require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
  # path '/api/posts' do
  #   get 'Get all posts' do
  #     tags 'Posts'
  #     consumes 'application/json'
  #     produces 'application/json'
  #     parameter name: :page, in: :query, type: :integer
  #     parameter name: :per_page, in: :query, type: :integer
  #     parameter name: :sort, in: :query, type: :string
  #     parameter name: :filter, in: :query, type: :string
  #     parameter name: :fields, in: :query, type: :string
  #     parameter name: :include, in: :query, type: :string

  #     response '200', 'posts found' do
  #       schema type: :object,
  #         properties: {
  #           data: {
  #             type: :array,
  #             items: {
  #               '$ref' => '#/components/schemas/post'
  #             }
  #           }
  #         },
  #         required: [ 'data' ]

  #       run_test!
  #     end

  #     response '401', 'unauthorized' do
  #       let(:
end
