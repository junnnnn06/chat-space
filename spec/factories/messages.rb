FactoryGirl.define do

  factory :message do
    body              "ヤッホー"
    image   File.open("#{Rails.root}/spec/fixtures/images/sample.jpg")
    group_id          1
    user_id           1
  end

  # factory :User do
  #   name     {Faker::Name.name}
  # end

  # factory :Group do
  #   name     {Faker::Name.name}
  # end
end
