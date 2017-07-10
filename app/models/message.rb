class Message < ApplicationRecord
  validates :user_id, null: false, foreign_key: true
  validates :group_id, null: false, foreign_key: true

  belongs_to :user
  belongs_to :member
end
