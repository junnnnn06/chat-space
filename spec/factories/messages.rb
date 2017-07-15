FactoryGirl.define do

  factory :message do
    body              "ヤッホー"
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/images/sample.jpg'))
  end
end
