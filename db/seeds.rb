# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all
user = User.create([
    {username: "User1"},
    {username: "User2"},
    {username: "User3"},
    {username: "User4"},
    {username: "User5"},
    {username: "User6"},
    {username: "User7"}
])
artworks = Artwork.create([
    {title: "starry nights", image_url: "www.artsare.com/art1", artist_id: User.find_by(username: "User1").id},
    {title: "ballerina", image_url: "www.artsare.com/art2", artist_id: User.find_by(username: "User1").id},
    {title: "sunflowers", image_url: "www.artsare.com/art3", artist_id: User.find_by(username: "User2").id},
    {title: "two sisters", image_url: "www.artsare.com/art4", artist_id: User.find_by(username: "User1").id},
    {title: "monalisa", image_url: "www.artsare.com/art5", artist_id: User.find_by(username: "User2").id}
])

artwork_shares = ArtworkShare.create([
    {artwork_id: Artwork.find_by(title: "starry nights").id, viewer_id: User.find_by(username: "User2").id},
    {artwork_id: Artwork.find_by(title: "starry nights").id, viewer_id: User.find_by(username: "User3").id},
    {artwork_id: Artwork.find_by(title: "monalisa").id, viewer_id: User.find_by(username: "User1").id},
    {artwork_id: Artwork.find_by(title: "monalisa").id, viewer_id: User.find_by(username: "User3").id},
    {artwork_id: Artwork.find_by(title: "monalisa").id, viewer_id: User.find_by(username: "User2").id},
    {artwork_id: Artwork.find_by(title: "monalisa").id, viewer_id: User.find_by(username: "User4").id},
    {artwork_id: Artwork.find_by(title: "monalisa").id, viewer_id: User.find_by(username: "User6").id},
    {artwork_id: Artwork.find_by(title: "sunflowers").id, viewer_id: User.find_by(username: "User4").id},
    {artwork_id: Artwork.find_by(title: "sunflowers").id, viewer_id: User.find_by(username: "User5").id},
    {artwork_id: Artwork.find_by(title: "sunflowers").id, viewer_id: User.find_by(username: "User6").id},
    {artwork_id: Artwork.find_by(title: "monalisa").id, viewer_id: User.find_by(username: "User7").id}
])