class AddProfilePictureAttachmentColumn < ActiveRecord::Migration[5.0]
  def change
    add_attachment :users, :profile_picture
  end
end
