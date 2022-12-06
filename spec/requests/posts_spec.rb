require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /index' do
    context '#index' do
      it 'Response should be successful' do
        get @posts_path
        expect(response).to be_successful
      end

      it 'Render the index template at root path' do
        get @posts_path
        expect(response).to render_template(:index)
      end

      it 'Should response with status 200' do
        get @posts_path
        expect(response).to have_http_status(200)
      end

      it 'Should render the index template' do
        get @posts_path
        expect(response).to render_template(:index)
      end
    end

    context '#show' do
      it 'Response should be successful' do
        get @post_path
        expect(response).to be_successful
      end

      it 'Should response with status 200' do
        get @post_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
