class Oystercard
  LIMIT_VALUE = 90
  attr_reader :balance, :in_use
  
  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "Balance cannot exceed £#{LIMIT_VALUE}" if @balance + amount > 90
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use
  end
end
