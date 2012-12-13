module Paypal

  class MicroFee < CustomFee
  
    def initialize()
      super(0.05, 0.05)
    end
  
  end
  
end
