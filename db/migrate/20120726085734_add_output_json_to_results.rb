class AddOutputJsonToResults < ActiveRecord::Migration
  def change
    add_column :results, :output_json, :text
  end
end
