class Admin < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
          :validatable, :omniauthable

end
