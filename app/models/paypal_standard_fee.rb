class PaypalStandardFee < PaypalCustomFee
  
  def initialize()
    super(0.029, 0.30)
  end

end
