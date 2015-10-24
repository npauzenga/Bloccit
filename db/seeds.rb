require 'faker'

# Create generic members
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create topics
150.times do
  Topic.create!(
    name:        Faker::Hipster.sentence,
    description: Faker::Hipster.paragraph
  )
end
topics = Topic.all

# create posts
500.times do
  post = Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title:  Faker::Hipster.sentence,
    body:   Faker::Hipster.paragraph
  )

  post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
  post.update_rank
  post.create_vote
end
posts = Post.all

# create summaries
50.times do
  Summary.create!(
    post: posts.sample,
    body: Faker::Hipster.paragraph
  )
end

# create comments
100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: Faker::Hipster.paragraph
  )
end

# create questions
10.times do
  Question.create!(
    title: Faker::Hipster.sentence,
    body: Faker::Hipster.paragraph,
    resolved: false
  )
end

# create advertisements
10.times do
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy: Faker::Lorem.paragraph,
    price: Faker::Commerce.price
  )
end

# Create an admin user
admin = User.new(
  name:     "Admin User",
  email:    "admin@example.com",
  password: "helloworld",
  role:     "admin"
)
admin.skip_confirmation!
admin.save!

# Create a moderator
moderator = User.new(
  name:     'Moderator User',
  email:    'moderator@example.com',
  password: 'helloworld',
  role:     'moderator'
)
moderator.skip_confirmation!
moderator.save!

# Create a member
member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)
member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{Summary.count} summaries created"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
