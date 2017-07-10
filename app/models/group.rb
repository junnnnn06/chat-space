class Group < ApplicationRecord
  has_many :members
  has_many :users, through: :members
  validates :name, presence: true

  def add_error_message
    if name.empty?
      errors.add(:name, "が記載されていません")
    end
  end
end
