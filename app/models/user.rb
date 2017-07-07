class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :encrypted_password, presence: true,
            length: { minimum: 8}

  validates :name, uniqueness: true
  validates :name, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true
end
