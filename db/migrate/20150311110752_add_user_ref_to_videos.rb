class AddUserRefToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :user_id, :integer, index: true
  end
end
