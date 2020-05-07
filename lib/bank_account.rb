class BankAccount
  attr_reader :name
  attr_accessor :balance, :status
  @all = []

  def initialize name
    @status = "open"
    @name = name
    @balance = 1000.00
  end

  def self.all
    @all
  end

  def self.find_account name
    all.find { |account| account.name == name }
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && balance.positive?
  end

  def close_account
    @status = "closed"
    @balance = 0
  end
end
