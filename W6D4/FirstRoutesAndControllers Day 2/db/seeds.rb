# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

bob = User.create!(username:'Bob') #1
daniel = User.create!(username:'Daniel')#2
cedric = User.create!(username:'Cedric')#3
joseph = User.create!(username:'Joseph')#4
john = User.create!(username:'John')#5
amy = User.create!(username:'Amy')#6


one = Artwork.create!(title: 'Mona Lisa', image_url:'www.toolong.com', artist_id: bob.id)
two = Artwork.create!(title: 'Flower', image_url: 'www.idk.com', artist_id: amy.id)
three = Artwork.create!(title: 'Tree', image_url: 'www.trees.com', artist_id: cedric.id)
four = Artwork.create!(title: 'House', image_url: 'www.house.com', artist_id: amy.id)
five = Artwork.create!(title: 'Artwork5', image_url: 'img_url5.com', artist_id: john.id)
six = Artwork.create!(title: 'Lisa6', image_url: 'img_url6.com', artist_id: daniel.id)

ArtworkShare.create!(artwork_id: one.id,viewer_id: amy.id)
ArtworkShare.create!(artwork_id: one.id,viewer_id: john.id)
ArtworkShare.create!(artwork_id: three.id,viewer_id: joseph.id)
ArtworkShare.create!(artwork_id: two.id,viewer_id: cedric.id)
ArtworkShare.create!(artwork_id: four.id,viewer_id: daniel.id)
ArtworkShare.create!(artwork_id: five.id,viewer_id: bob.id) 