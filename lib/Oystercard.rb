class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    total = @balance + amount
    if total > 90
      fail "Balance can not exceed #{limit_value}"
    else
      @balance += amount
    end
  end

end

LIMIT_VALUE = 90