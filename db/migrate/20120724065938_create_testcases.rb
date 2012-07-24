class CreateTestcases < ActiveRecord::Migration
  def change
    create_table :testcases do |t|
      t.references :task
      t.text :input_data
      t.boolean :public

      t.timestamps
    end
    add_index :testcases, :task_id
  end
end
