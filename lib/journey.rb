class Journey
    PENALTY_FARE = 6
    MINIMUM_FARE = 1

    def initialize
        @journey = {}
    end

    def entry_station(card, station)
        card.get_fare(PENALTY_FARE) unless @journey.empty?
        card.journeys << @journey unless @journey.empty?
        @journey = {entry_station: station}
      end
    
      def exit_station(card, station)
        @journey[:entry_station] ? card.get_fare(MINIMUM_FARE) : card.get_fare(PENALTY_FARE) 
        # if @journey[:entry_station]
        #   deduct(MINIMUM_FARE)
        # else
        #   deduct(PENALTY_FARE)
        # end
    
        @journey[:exit_station] = station
        card.journeys << @journey
        @journey = {}
      end

end