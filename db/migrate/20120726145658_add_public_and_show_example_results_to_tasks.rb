class AddPublicAndShowExampleResultsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :public, :boolean
    add_column :tasks, :show_example_results, :boolean
  end
end
