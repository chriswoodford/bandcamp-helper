class AddPaypalIdIndexToLineItem < ActiveRecord::Migration
  def change
    add_index :line_items, :paypal_id
  end
end
