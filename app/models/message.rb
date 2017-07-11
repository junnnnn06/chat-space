class Message < ApplicationRecord
  validates :user_id, null: false, foreign_key: true
  validates :group_id, null: false, foreign_key: true
  validates :name, :image, null: false

  belongs_to :user
  belongs_to :member
  mount_uploader :image, ImageUploader
end
