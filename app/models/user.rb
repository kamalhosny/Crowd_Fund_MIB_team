class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :comments
  has_many :campaigns

  include DeviseTokenAuth::Concerns::User

  validates :username, presence: true
end
