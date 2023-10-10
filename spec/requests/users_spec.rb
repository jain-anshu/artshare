require 'rails_helper'

RSpec.describe "Users", type: :request do
  context 'all the UsersController routes work as expected' do
    before do
      u1 = User.create({username: "testuser1"})
      u2 = User.create({username: "testuser2"})
    end
    describe "GET /index" do
      it 'returns all the users' do
        get "/users"
        users = JSON.parse(response.body)
        expect(users.length).to eq(User.all.length)
        expect(users[0]['username']).to eq(User.first.username)
        expect(response).to have_http_status(:ok)
      end
    end

    describe "GET /show" do
      it 'returns the user corresponding to the params[:id]' do
        get "/users/#{User.first.id}"
        user = JSON.parse(response.body)
        expect(user['username']).to eq(User.first.username)
        expect(response).to have_http_status(:ok)
      end
    end

    describe "POST /create" do
      it 'creates the user as specified in the params[:user]' do
        post "/users", params: {user: {username: "testuser3"}}
        user = JSON.parse(response.body)
        expect(user['username']).to eq(User.last.username)
        expect(response).to have_http_status(:created)
      end
    end

    describe "PUT /update" do
      it 'updates the user attribute as specified in params[:user]' do 
        put "/users/#{User.second.id}", params: {user: {username: "new_testuser2"}}
        user = JSON.parse(response.body)
        expect(user['username']).to eq('new_testuser2')
        expect(response).to have_http_status(:ok)
      end


    end
  end
end
