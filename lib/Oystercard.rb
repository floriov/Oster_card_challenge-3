class Oystercard
  LIMIT_VALUE = 90

  attr_reader :balance, :exit_station
  attr_accessor :journeys
   
  def initialize
    @balance = 0
    @journeys = []
    @journey = nil
  end

  def top_up(amount)
    fail "Balance cannot exceed £#{LIMIT_VALUE}" if @balance + amount > LIMIT_VALUE
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance." if @balance < Journey::MINIMUM_FARE
    @journey = Journey.new unless @journey
    @journey.entry_station(self, station)
  end

  def touch_out(station)
    @journey = Journey.new unless @journey
    @journey.exit_station(self, station)
    @journey = nil
  end

  def in_journey?
     @journey != nil
  end

  def get_fare(fare)
    deduct(fare)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
  
end
