class AddStatusToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :sales_status, :integer
  end
end
