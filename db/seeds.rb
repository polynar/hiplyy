# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(
    name: 'David Polynar',
    username: 'dp',
    email: 'dp@dp.com',
    password: 'asdasd',
    bio: Faker::Lorem.sentence,
    website: Faker::Internet.domain_name,
    phone: Faker::PhoneNumber.cell_phone_with_country_code,
    gender: 'Male',
    )
10.times do
  open(Faker::LoremFlickr.image('640x480', ['nature','landscape', 'mountain'])) do |image|
    File.open("./test.jpg", "wb") do |file|
      file.write(image.read)
    end
  end
  blob = ActiveStorage::Blob.create_after_upload!(io: File.open('./test.jpg'), filename: 'test.jpg')
  Post.create!(
      description: Faker::Lorem.sentence,
      user_id: user.id,
      image: blob
  )
end

50.times do
  user = User.create!(
    name: Faker::Name.name,
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    bio: Faker::Lorem.sentence,
    website: Faker::Internet.domain_name,
    phone: Faker::PhoneNumber.cell_phone_with_country_code,
    gender: Faker::Gender.type,
  )
  blob = ActiveStorage::Blob.create_after_upload!(io: File.open('./default.png'), filename: 'default.png')
  user.avatar.attach(blob)
  10.times do
    open(Faker::LoremFlickr.image('640x480', ['nature','landscape', 'mountain'])) do |image|
      File.open("./test.jpg", "wb") do |file|
        file.write(image.read)
      end
    end
    blob = ActiveStorage::Blob.create_after_upload!(io: File.open('./test.jpg'), filename: 'test.jpg')
    Post.create!(
        description: Faker::Lorem.sentence,
        user_id: user.id,
        image: blob
    )

  end
end

