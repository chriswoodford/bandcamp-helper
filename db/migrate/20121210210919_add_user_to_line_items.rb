class AddUserToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :user_id, :integer
    add_index  :line_items, :user_id
  end
end
