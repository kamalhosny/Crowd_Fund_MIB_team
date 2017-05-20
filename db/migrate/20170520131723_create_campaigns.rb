class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.integer :achieved
      t.integer :goal
      t.string :video
      t.boolean :status
      t.timestamps
    end
  end
end
