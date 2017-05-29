class AddAttachmentProfilePhotoToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :profile_photo
    end
  end

  def self.down
    remove_attachment :campaigns, :profile_photo
  end
end
