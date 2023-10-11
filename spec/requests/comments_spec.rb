require 'rails_helper'

RSpec.describe "Comments", type: :request do
  before do
    artist = User.create(username: "Artist1")
    commenter = User.create(username: "Commenter1")
    artwork = Artwork.create(title: "Art1", image_url: "www.testurl.com", artist_id: artist.id)
    comment = Comment.create(body: "Beautiful painting!", commenter_id: commenter.id, artwork_id: artwork.id)
  end
  describe "GET /index" do
    it 'gets all the comments belonging to commenter specified by user_id' do
      get "users/#{commenter.id}/artworks"
      expect(JSON.parse(response.body[0]['body'])).to eq("Beautiful painting!")
    end
    pending "add some examples (or delete) #{__FILE__}"
  end
end
