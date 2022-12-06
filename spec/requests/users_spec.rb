require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    context '#index' do
      before(:each) do
        get users_path
      end

      it 'Should response with status 200' do
        expect(response).to have_http_status(200)
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
  end
end
   

