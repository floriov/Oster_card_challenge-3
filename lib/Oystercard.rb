class Oystercard
  LIMIT_VALUE = 90
  attr_reader :balance
  
  def initialize
    @balance = 0
  end

  def top_up(amount)
    total = @balance + amount
    if total > 90
      fail "Balance cannot exceed £#{LIMIT_VALUE}"
    else
      @balance += amount
    end
  end
end
