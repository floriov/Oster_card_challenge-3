class Journey
    PENALTY_FARE = 6
    MINIMUM_FARE = 1

    def initialize
        @journey = {}
    end

    def entry_station(card, station)
        fare(card) unless @journey.empty?
        card.journeys << @journey unless @journey.empty?
        @journey = {entry_station: station}
      end
    
      def exit_station(card, station)
        @journey[:exit_station] = station
        fare(card)
        card.journeys << @journey
        @journey = {}
      end

      def fare(card)
        return card.get_fare(MINIMUM_FARE) if @journey[:entry_station] && @journey[:exit_station]
        card.get_fare(PENALTY_FARE) 
      end

end