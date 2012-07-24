class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.text :source_code
      t.references :runnable, :polymorphic => true
      t.boolean :is_graded

      t.timestamps
    end
    add_index :codes, :runnable_id
  end
end
