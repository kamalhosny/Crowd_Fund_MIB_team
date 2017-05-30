class AddAttachmentCoverPhotoToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :cover_photo
    end
  end

  def self.down
    remove_attachment :campaigns, :cover_photo
  end
end
