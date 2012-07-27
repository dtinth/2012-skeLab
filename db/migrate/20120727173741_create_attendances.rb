class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :user
      t.references :period

      t.timestamps
    end
    add_index :attendances, :user_id
    add_index :attendances, :period_id
  end
end
