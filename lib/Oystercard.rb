class Oystercard
  LIMIT_VALUE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :in_use, :entry_station
  
  def initialize
    @balance = 0
    @in_use = false
    @entry_station = nil
  end

  def top_up(amount)
    fail "Balance cannot exceed £#{LIMIT_VALUE}" if @balance + amount > LIMIT_VALUE
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance." if @balance < MINIMUM_FARE
    #@in_use = true
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    #@in_use = false
    @entry_station = nil
  end

  def in_journey?
    if @entry_station.nil?
      false     
   else
     true
   end
  end

  private

  def deduct(amount)
    @balance -= amount
  end
  
end
