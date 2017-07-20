class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :encrypted_password, presence: true,
            length: { minimum: 8}

  validates :name, uniqueness: true, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :members
  has_many :groups, through: :members
  has_many :messages
  scope :search, -> (keyword, current_user){ where('name LIKE(?)', "%#{keyword}%").where.not(id: current_user.id)}
end
