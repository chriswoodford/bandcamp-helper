class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    
    @user = User.create(params[:user])
    
    if @user.save
      login @user
      redirect_to root_path
    else
      render 'new'
    end
    
  end
  
  def show
    
    @user = current_user
    @items = current_user.line_items
    @payments = current_user.bandcamp_payments
    
    @gross_revenue = 0.00
    @net_revenue = 0.00
    @revenue_share = 0.00
    @paypal_fees = 0.00
    @revenue_share_collected = 0.00
    
    @items.each do |item|
      @gross_revenue += item.total
      @net_revenue += item.net_total
      @revenue_share += item.revenue_share
      @paypal_fees += item.paypal_fee   
    end
    
    @payments.each do |p|
      @revenue_share_collected += p.amount_collected
    end
    
  end
  
end
