class Campaign < ApplicationRecord
  has_attached_file :profile_photo
  has_attached_file :cover_photo
  has_attached_file :description_photo
  validates :title, :description, :goal, presence: true


  belongs_to :user
  has_many :comments
end
