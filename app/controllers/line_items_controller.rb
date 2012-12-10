class LineItemsController < ApplicationController

  require 'csv'
  
  before_filter :logged_in_user
  
  def new
  end

  def create

    valid_columns = ['order date', 'item name', 'item price', 'quantity',
          'tax', 'shipping', 'assessed revenue share', 'currency', 'paypal fee', 
          'paypal transaction id']
    valid_fields = [:purchase_date, :name, :price, :quantity, :tax, :shipping, 
          :revenue_share, :currency, :paypal_fee, :paypal_id] 

    CSV.parse(params[:filename].read, :headers => true) do |row|
      
      valid_row = row.fields(*valid_columns)
      
      values = Hash[valid_fields.zip(valid_row)]
      values[:purchase_date] = DateTime.strptime(values[:purchase_date], '%m/%d/%y %H:%M%p')
      
      current_user.line_items.create!(values)
      
      if row.field('collected revenue share').to_f > 0
        current_user.bandcamp_payments.create!({ 
          payment_date: values[:purchase_date],
          currency: values[:currency],
          amount_collected: row.field('collected revenue share').to_f
        })   
      end
      
    end
    
  end

end
