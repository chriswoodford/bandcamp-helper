class CreateBandcampPayments < ActiveRecord::Migration
  def change
    create_table :bandcamp_payments do |t|
      t.datetime :payment_date
      t.decimal :amount_collected

      t.timestamps
    end
  end
end
