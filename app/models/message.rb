class Message < ApplicationRecord
  validates :body, presence: true, unless: :image?

  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader

  private

  def has_data
    body.present? || image.present?
  end
end
