class Journeylog
    attr_reader :journey_class, :journeys 
 
    def initialize(journey_class: )
      @journey_class = journey_class
      @journeys = []
      #@journey = {}
      
     end
    
    def start(station)
      @journeys << journey_class.new(entry_station: station)
      p @journeys
    end

end