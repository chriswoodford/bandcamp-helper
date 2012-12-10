class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.datetime :purchase_date
      t.string :name
      t.decimal :price
      t.decimal :tax
      t.decimal :shipping
      t.integer :quantity
      t.string :currency
      t.decimal :revenue_share
      t.decimal :paypal_fee
      t.string :paypal_id

      t.timestamps
    end
  end
end
