class EditRelationshipTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :relationships, :target_id, :friend_id
  end
end
