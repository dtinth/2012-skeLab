class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|

      t.references :code
      t.references :testcase
      t.text :input
      t.text :output
      t.boolean :is_graded

      t.timestamps

    end
  end
end
