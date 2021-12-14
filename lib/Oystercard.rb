class Oystercard
  LIMIT_VALUE = 90
  attr_reader :balance
  
  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Balance cannot exceed £#{LIMIT_VALUE}" if @balance + amount > 90
    @balance += amount
  end
end
