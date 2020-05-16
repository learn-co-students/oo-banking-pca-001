class BankAccount
  attr_reader :name
  attr_accessor :status, :balance

  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end
  
  def deposit(deposit)
    @balance += deposit
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    @status == "open" && balance.positive?
  end

  def close_account
    @status = "closed"
    @balance = 0
  end

end
