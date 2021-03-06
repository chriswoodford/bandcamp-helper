# == Schema Information
#
# Table name: bandcamp_payments
#
#  id               :integer          not null, primary key
#  payment_date     :datetime
#  amount_collected :decimal(, )
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  currency         :string(255)
#

class BandcampPayment < ActiveRecord::Base
  attr_accessible :amount_collected, :payment_date, :currency
  belongs_to :user
end
