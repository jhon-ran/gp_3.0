require 'faker'

City.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
User.destroy_all
Gossip.destroy_all
TagGossip.destroy_all
Comment.destroy_all

# seed pour les city

10.times do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Base.regexify(/[0-8][0-9][0-9]{3}/)
  )
end


# seed tag
10.times do
  Tag.create!(
    title: Faker::Lorem.word
  )
end


# seed pm
10.times do
  PrivateMessage.create!(
    content: Faker::Lorem.paragraph(2)
  )
end


# seed user
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: Faker::Number.between(from: 18, to: 50),
    password_digest: 'password',
    city_id: City.all.sample.id
  )
end



# seed gossip

# seed for gossip
10.times do
  Gossip.create!(
    title: Faker::Hipster.word,
    content: Faker::Hipster.paragraph_by_chars(characters: 25, supplemental: false),
    user_id: User.all.sample.id
  )
end




# seed tag_gossip
10.times do
  TagGossip.create!(
    tag_id: Tag.all.sample.id,
    gossip_id: Gossip.all.sample.id
  )
end


