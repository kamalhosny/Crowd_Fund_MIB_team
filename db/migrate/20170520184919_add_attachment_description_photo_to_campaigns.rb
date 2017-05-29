class AddAttachmentDescriptionPhotoToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :description_photo
    end
  end

  def self.down
    remove_attachment :campaigns, :description_photo
  end
end
