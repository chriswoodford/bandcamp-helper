class StaticPagesController < ApplicationController
  
  def home
    
    @items = LineItem.all
    @gross_revenue = 0.00
    @net_revenue = 0.00
    @revenue_share = 0.00
    @paypal_fees = 0.00
    
    @items.each do |item|
      @gross_revenue += item.total
      @net_revenue += item.net_total
      @revenue_share += item.revenue_share
      @paypal_fees += item.paypal_fee   
    end
    
  end
  
end
