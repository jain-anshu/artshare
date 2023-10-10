require 'rails_helper'

RSpec.describe "Artworks", type: :request do
  context "when there is some artworks created by an artist" do
    before do
      User.create(username: "testuser1")
      Artwork.create(title: "Rachel", image_url: "www.example.com/rachel", artist_id: User.find_by(username: "testuser1").id)
      Artwork.create(title: "Clown", image_url: "www.example.com/clown", artist_id: User.find_by(username: "testuser1").id)
    end
    describe "GET /index" do
      it 'renders all the artworks' do
        get '/artworks'
        artworks = JSON.parse(response.body)
        expect(artworks.length).to  eq(2)
        expect(artworks[0]["title"]).to eq(Artwork.first.title)
        expect(response).to  have_http_status(:ok)

      end
    end

    describe "GET /show" do
      it "renders the artwork corresponding to params[:id]" do
        get "/artworks/#{Artwork.find_by(title: "Clown").id}"
        artworks = JSON.parse(response.body)
        expect(artworks["title"]).to eq(Artwork.second.title)
        expect(response).to  have_http_status(:ok)
      end
    end

    describe "PUT /update" do
      it "changes the attributes as specified in the request" do
        put "/artworks/#{Artwork.find_by(title: "Clown").id}",  params: { artwork: {title: "Sad Clown"} }
        artwork = JSON.parse(response.body)
        expect(artwork["title"]).to eq("Sad Clown")
      end
    end

    describe "DELETE /destroy" do
      it "deletes the record matching the id" do
        delete "/artworks/#{Artwork.find_by(title: "Clown").id}"
        get "/artworks"
        artworks = JSON.parse(response.body)
        expect(artworks.length).to eq(1)
      end
    end

    describe "POST /create" do
      it "deletes the record matching the id" do
        post "/artworks/", params: {artwork: {title: "house with red roof", image_url: "www.painting.com/housewithredroof", artist_id: User.find_by(username: "testuser1").id}}
        get "/artworks"
        artworks = JSON.parse(response.body)
        expect(artworks.length).to eq(3)
      end
    end
  end
end
