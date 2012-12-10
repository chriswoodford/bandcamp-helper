class PaypalMicroFee < PaypalCustomFee

  def initialize()
    super(0.05, 0.05)
  end

end
