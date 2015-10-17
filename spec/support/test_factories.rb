module TestFactories
  def associated_post_unsaved(options = {})
    post_options = {
      title: "Post title",
      body:  "Post bodies must be pretty long.",
      topic: Topic.create(name: "Topic name"),
      user:  authenticated_user
    }.merge(options)

    Post.new(post_options)
  end

  def associated_post(options = {})
    associated_post_unsaved(options).tap { |post| post.save }
  end

  def authenticated_user(options = {})
    user_options = {
      email:    "email#{rand}@fake.com",
      password: "password"
    }.merge(options)

    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end
end
