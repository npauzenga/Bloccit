require 'faker'

# create posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
posts = Post.all

# create comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

Post.create!(
  title: "I have thoughts",
  body: "But I've forgetten"
)

Comment.create!(
  post: Post.where(title: "I have thoughts").take!,
  body: "Profound."
)
