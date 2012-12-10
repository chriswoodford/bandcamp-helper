# == Schema Information
#
# Table name: bandcamp_payments
#
#  id               :integer          not null, primary key
#  payment_date     :datetime
#  amount_collected :decimal(, )
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class BandcampPayment < ActiveRecord::Base
  attr_accessible :amount_collected, :payment_date
  belongs_to :user
end
