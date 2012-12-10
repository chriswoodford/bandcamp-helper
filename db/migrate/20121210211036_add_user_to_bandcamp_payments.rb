class AddUserToBandcampPayments < ActiveRecord::Migration
  def change
    add_column :bandcamp_payments, :user_id, :integer
    add_index  :bandcamp_payments, :user_id
  end
end
