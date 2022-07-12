# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.delete_all
  Artwork.delete_all

  Nikky = User.create(
    username: 'Nikky'
  )

  Leo = User.create(
    username: 'Leo'
  )

  Kin = User.create(
    username: 'Ka'
  )

  Ayce = User.create(
    username: 'Lecap'
  )

  Victor = User.create(
    username: 'He'
  )

  Mona = Artwork.create(
    title: 'Mona Lisa',
    image_url: 'LOLOLOL',
    artist_id: 1
  )

  Michelangelo = Artwork.create(
    title: 'David',
    image_url: 'AWS',
    artist_id: 2
  )

  Ape = Artwork.create(
    title: 'NFT',
    image_url: 'SCAM',
    artist_id: 3
  )

  Purell = Artwork.create(
    title: 'Hand Sanitizer',
    image_url: 'CLEAN',
    artist_id: 4
  )

  Scooby = Artwork.create(
    title: 'Shaggy',
    image_url: 'high',
    artist_id: 5
  )

  ArtworkShare.create(
    artwork_id: 1,
    viewer_id: 5
  )

  First_Comm = Comment.create(
    artwork_id: 1,
    commenter_id: 2,
    body: 'Yo this looks hella fire, no cap'
  )

  Second_Comm = Comment.create(
    artwork_id: 1,
    commenter_id: 1,
    body: 'Thank you!!!'
  )
end