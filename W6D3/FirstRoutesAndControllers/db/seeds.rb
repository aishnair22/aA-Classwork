# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all


User.create(username:'Bob') #1
User.create(username:'Daniel')#2
User.create(username:'Cedric')#3
User.create(username:'Joseph')#4
User.create(username:'John')#5
User.create(username:'Amy')#6


Artwork.create(title: 'Mona Lisa', image_url:'www.toolong.com', artist_id: 1)
Artwork.create(title: 'Flower', image_url: 'www.idk.com', artist_id: 4)
Artwork.create(title: 'Tree', image_url: 'www.trees.com', artist_id: 1)
Artwork.create(title: 'House', image_url: 'www.house.com', artist_id: 5)
Artwork.create(title: 'Artwork5', image_url: 'img_url5.com', artist_id: 2)
Artwork.create(title: 'Lisa6', image_url: 'img_url6.com', artist_id: 3)

ArtworkShare.create(artwork_id: 1,viewer_id: 1)
ArtworkShare.create(artwork_id: 1,viewer_id: 5)
ArtworkShare.create(artwork_id: 3,viewer_id: 3)
ArtworkShare.create(artwork_id: 2,viewer_id: 4)
ArtworkShare.create(artwork_id: 4,viewer_id: 6)
ArtworkShare.create(artwork_id: 5,viewer_id: 2) 