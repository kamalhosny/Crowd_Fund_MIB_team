class AddUserRefToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_refrence :campaigns, :user, foreign_key: true
  end
end
