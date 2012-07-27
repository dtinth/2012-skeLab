class AddRunResultToCodesAndResults < ActiveRecord::Migration
  def change
    add_column :codes, :is_success, :boolean
    add_column :codes, :error_messages, :string
    add_column :results, :is_success, :boolean
    add_column :results, :error_messages, :string
  end
end
