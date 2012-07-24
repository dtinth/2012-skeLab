class AddTaskToCode < ActiveRecord::Migration
  def change
    add_column :codes, :task_id, :integer
  end
end
