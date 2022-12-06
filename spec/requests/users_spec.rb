require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /index' do
    context '#index' do
      before(:each) do
        get users_path
      end

      it 'Should response with status 200' do
        expect(response).to have_http_status(200)
      end

      it 'Should response body include text' do
        expect(response.body).to include('User')
      end

      it 'Should response body includes correct placeholder text' do
        expect(response.body).to include('User')
      end

      it 'Should render the index template' do
        expect(response).to render_template(:index)
      end

      it 'Should return http success' do
        expect(response).to have_http_status(:success)
      end

      it 'Response should be successful' do
        expect(response).to be_successful
      end

      it 'Render the index template at root path' do
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

      it 'Should render the index template' do
        get @post_path
        expect(response).to render_template(:index)
      end
    end
  end
end
