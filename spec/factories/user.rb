FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email, 200) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now

    factory :user_with_post_and_comment do
      after(:build) { |user| create(:post, user: user) }
      after(:build) { |user| create(:comment, user: user) }
    end
  end
end
