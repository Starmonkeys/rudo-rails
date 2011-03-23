class AddUserIdToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :user_id, :string
  end

  def self.down
    remove_column :tasks, :user_id
  end
end
