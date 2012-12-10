# == Schema Information
#
# Table name: line_items
#
#  id            :integer          not null, primary key
#  purchase_date :datetime
#  name          :string(255)
#  price         :decimal(, )
#  tax           :decimal(, )
#  shipping      :decimal(, )
#  quantity      :integer
#  currency      :string(255)
#  revenue_share :decimal(, )
#  paypal_fee    :decimal(, )
#  paypal_id     :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe LineItem do

  before do
    @item = LineItem.new(
      purchase_date: "1981-08-04 08:40:00", 
      name: "TITAN - BURN",
      price: 20.00, 
      tax: 0.00,
      shipping: 10.00,
      quantity: 1,
      currency: "CAD",
      revenue_share: 2.00,
      paypal_fee: 1.17,
      paypal_id: "8R1142623X4202838",
    )
  end

  subject { @item }
  
  it { should respond_to(:purchase_date) }
  it { should respond_to(:name) }
  it { should respond_to(:price) }
  it { should respond_to(:tax) }
  it { should respond_to(:shipping) }
  it { should respond_to(:quantity) }
  it { should respond_to(:currency) }
  it { should respond_to(:revenue_share) }
  it { should respond_to(:paypal_fee) }
  it { should respond_to(:paypal_id) }

  it { should be_valid }

  describe "when purchase date is not present" do
    before { @item.purchase_date = nil }
    it { should_not be_valid }
  end
  
end
