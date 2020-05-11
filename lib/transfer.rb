class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid? && status == "pending"
  end

  def execute_transaction
    valid = @sender.balance >+ amount && valid?
    if valid
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    return unless @status == "complete"
    Transfer.new(receiver, sender, amount).execute_transaction
    @status = "reversed"
  end
  
end
