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
      
      values = Hash[valid_fields.zip(valid_row)]
      values[:purchase_date] = DateTime.strptime(values[:purchase_date], '%m/%d/%y %H:%M%p')
      
      LineItem.create!(values)
      
      if row.field('collected revenue share').to_f > 0
        BandcampPayment.create!({ 
          payment_date: values[:purchase_date],
          amount_collected: row.field('collected revenue share').to_f
        })   
      end
      
    end
    
  end

end
