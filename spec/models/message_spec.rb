require 'rails_helper'

describe Message do
  describe '#create' do

    it "is valid with a body, image" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is valid without a message" do
      message = build(:message, body: nil)
      expect(message.errors[:body]).to include("can't be blank")
    end

    it "is valid without a image" do
      message = build(:image)
      let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg' }
      expext(message.errors[:image]).to include("need image")
    end

    it ""


  end
end
