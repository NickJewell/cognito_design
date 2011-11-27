class FixCreatedByUserIdOnResources < ActiveRecord::Migration
  def up
    rename_column :resources, :created_by_user, :user_id
  end

  def down
    rename_column :resources, :user_id, :created_by_user
  end
end
