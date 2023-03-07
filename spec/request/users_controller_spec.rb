require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  context 'GET index' do
    before(:example) do
      get '/users'
    end

    it 'should be 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render a correct template' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Users')
    end
  end
end

