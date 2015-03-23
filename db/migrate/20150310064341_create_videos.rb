class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :url
      t.string :content
      t.integer :folder_id
      t.timestamps
    end
  end
end
