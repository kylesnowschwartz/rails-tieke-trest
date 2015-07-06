FactoryGirl.define do
  factory :post do
    img_url {Faker::Avatar.image}
    caption {Faker::Hacker.say_something_smart}
    user nil
  end

end
