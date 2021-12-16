require 'journey'

describe Journey do
    let(:card){ double :card, get_fare: nil, journeys: [] }
    let(:station){ double :station }

  it 'knows if a journey is incomplete' do 
    subject.entry_station(card, station)
    expect(subject.fare(card)).to eq ("Journey incomplete")
  end
end
