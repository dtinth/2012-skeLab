class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.boolean :is_active, :default => false
      t.date :date

      t.timestamps
    end
  end
end
