class StaticPagesController < ApplicationController
    
  def home
    
    redirect_to current_user if logged_in?
    
  end
  
end
