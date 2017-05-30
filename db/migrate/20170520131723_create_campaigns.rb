class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :achieved, default:0
      t.integer :goal, null: false
      t.string :video
      t.boolean :status, default: false
      t.timestamps
    end
  end
end
