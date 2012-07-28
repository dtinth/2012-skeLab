class AddDefaultCodeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :default_code, :text
  end
end
