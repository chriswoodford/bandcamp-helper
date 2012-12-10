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

class LineItem < ActiveRecord::Base
  
  attr_accessible :currency, :name, :paypal_fee, :paypal_id, :price, 
                  :purchase_date, :quantity, :revenue_share, :shipping, :tax
                  
  belongs_to :user
                  
  validates :currency, presence: true
  validates :name, presence: true
  validates :paypal_fee, presence: true
  validates :price, presence: true
  validates :purchase_date, presence: true
  validates :quantity, presence: true
  validates :revenue_share, presence: true
  validates :shipping, presence: true
  validates :tax, presence: true

  after_initialize :default_values
  before_save :cleanup_values

  def sub_total
    price * quantity
  end

  def total
    sub_total + tax + shipping
  end

  def net_total
    total - paypal_fee - revenue_share
  end

  private
  
    def default_values
      self.paypal_fee ||= 0.00
      self.price ||= 0.00
      self.quantity ||= 0
      self.revenue_share ||= 0.00
      self.shipping ||= 0.00
      self.tax ||= 0.00
    end
    
    def cleanup_values
      self.paypal_id = '' if self.paypal_id.downcase == 'to bandcamp'
    end
    
end
