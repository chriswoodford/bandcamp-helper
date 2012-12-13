module Paypal

  class CustomFee
    
    attr_accessor :percentage, :fixed_amount
    
    def initialize(percentage, fixed_amount)
      self.percentage = percentage
      self.fixed_amount = fixed_amount
    end
    
    def calculate(totalable)
      
      ((totalable.total * percentage) + fixed_amount).round(2)
      
    end
  
  end

end