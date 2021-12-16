class Oystercard
  LIMIT_VALUE = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :balance, :entry_station, :exit_station, :journeys
   
  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = []
    @journey = {}
  end

  def top_up(amount)
    fail "Balance cannot exceed £#{LIMIT_VALUE}" if @balance + amount > LIMIT_VALUE
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance." if @balance < MINIMUM_FARE
    deduct(PENALTY_FARE) unless @journey.empty?
    @journeys << @journey unless @journey.empty?
    @journey = {entry_station: station}
  end

  def touch_out(station)
    @journey[:entry_station] ? deduct(MINIMUM_FARE) : deduct(PENALTY_FARE) 
    # if @journey[:entry_station]
    #   deduct(MINIMUM_FARE)
    # else
    #   deduct(PENALTY_FARE)
    # end

    @journey[:exit_station] = station
    @journeys << @journey
    @journey = {}
  end

  def in_journey?
     @journey[:entry_station] != nil 
     
  end


  private

  def deduct(amount)
    @balance -= amount
  end
  
end
