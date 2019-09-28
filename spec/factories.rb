FactoryBot.define do
  
  factory :user do
    first_name { "Bill" }
    last_name { "Gates" }
    email { "bill@yopmail.com" }
    password { "pass1234" }
  end

  factory :question do
    user
    content { "What is rails?" }
  end

  factory :comment do
    user
    commentable { |a| a.association(:question) }
    body { "Rails is a ruby framework." }
  end

end