FactoryGirl.define do

  # factory :message do
  #   body              "ヤッホー"
  #   image   File.open("#{Rails.root}/spec/fixtures/images/sample.jpg")
  #   group_id     1
  #   user_id       4
  # end

  factory :message do
    body              "ヤッホー"
    image   File.open("#{Rails.root}/spec/fixtures/images/sample.jpg")
    group     {build(:group)}
    user      {build(:user)}
  end
end
