class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable

  has_many :comments
  has_many :campaigns
  has_attached_file :profile_picture,
  :styles => {large: "1000x1000>", medium: "300x300>", thumb: "100x100#"},
  default_url: "assets/images/:style/missing.png"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\Z/


  include DeviseTokenAuth::Concerns::User

  validates :username,presence: true

end
