require 'pry'
class Transfer
  attr_reader :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  def valid?
    @sender.valid? && @receiver.valid? && @status == "pending" &&
    @sender.balance - @amount > 0
  end
  def execute_transaction
    if valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete"
      @sender, @receiver = @receiver, @sender
      @status = "pending"
      execute_transaction
      @status = "reversed"
    end
  end
end
