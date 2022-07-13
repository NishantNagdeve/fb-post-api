require 'rails_helper'

describe 'Users API', type: :request do
  it 'returns all users' do
  	FactoryBot.create(:user, name: "Ramesh", password: "123")
  	FactoryBot.create(:user, name: "Suresh", password: "123")
  	FactoryBot.create(:user, name: "Rupesh", password: "123")

  	get '/api/v1/users'

  	expect(response).to have_http_status(:success)
  	expect(JSON.parse(response.body).size).to eq(3)
  end
end