require 'rails_helper'

describe Message do
  describe '#create' do

    it "is valid with a body and image?" do
      # message = build(:message)
      # binding.pry
      # expect(message).to be_valid
    end

    it "is valid with a message" do
      message = build(:message, body: nil)
      expect(message).to be_valid
    end

    it "is valid with a message" do
      message = build(:message, image: nil)
      expect(message).to be_valid
    end

    # it "is valid without a body and image" do
    #   message = build(:message, message: nil, image: nil)
    #   expect(message.errors[:body, :image]).to include("が保存には必要です")
    # end

    # it "is valid without a group_id"
    # message = build(:message, password: nil)




  end
end
