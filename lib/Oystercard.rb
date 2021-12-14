class Oystercard
  LIMIT_VALUE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :in_use
  
  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "Balance cannot exceed £#{LIMIT_VALUE}" if @balance + amount > LIMIT_VALUE
    @balance += amount
  end

  def touch_in
    raise "Insufficient balance." if @balance < MINIMUM_FARE
    @in_use = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_use = false
  end

  def in_journey?
    @in_use
  end

  private

  def deduct(amount)
    @balance -= amount
  end
  
end
