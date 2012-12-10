class LineItemsController < ApplicationController

  require 'csv'
  
  def new
  end

  def create

    @items = []
    valid_columns = ['order date', 'item name', 'item price', 'quantity',
          'tax', 'shipping', 'assessed revenue share', 'currency', 'paypal fee', 
          'paypal transaction id']
    valid_fields = [:purchase_date, :name, :price, :quantity, :tax, :shipping, 
          :revenue_share, :currency, :paypal_fee, :paypal_id] 

    CSV.parse(params[:filename].read, :headers => true) do |row|
      
      valid_row = row.fields(*valid_columns)
      
      params = Hash[valid_fields.zip(valid_row)]
      params[:purchase_date] = DateTime.strptime(params[:purchase_date], '%m/%d/%y %H:%M%p')
      
      LineItem.create!(params)
      #@items.push params 
      
    end
    
  end

end
