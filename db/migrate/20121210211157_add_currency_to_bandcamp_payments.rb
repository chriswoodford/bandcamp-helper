class AddCurrencyToBandcampPayments < ActiveRecord::Migration
  def change
    add_column :bandcamp_payments, :currency, :string
    add_index  :bandcamp_payments, :currency
  end
end
