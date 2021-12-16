class Oystercard
  LIMIT_VALUE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station, :exit_station, :journeys, :journeys2
   
  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = {}
    @journeys2 = {}
  end

  def top_up(amount)
    fail "Balance cannot exceed £#{LIMIT_VALUE}" if @balance + amount > LIMIT_VALUE
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance." if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)

    @journeys["entry_station"] = @entry_station
    @journeys["exit_station"] = station

    
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
