require 'Oystercard'

describe Oystercard do
  let(:card) { Oystercard.new }
  let(:station) { "Waterloo" }

  it { is_expected.to have_attributes(balance: 0) }
  it { is_expected.to respond_to(:top_up).with(1).argument }
  it { is_expected.to respond_to(:touch_in, :touch_out, :in_journey?) }

  describe '#top_up' do
    it "adds top_up amount to balance" do
      expect { card.top_up(40) }.to change(card, :balance).by(40)
    end
    it "throws an error if the top_up called would exceed the £90 limit of the balance" do
      expect { card.top_up(100) }.to raise_error"Balance cannot exceed £#{Oystercard::LIMIT_VALUE}"
    end
  end

  describe '#touch_in' do
    context 'with sufficient balance' do
      it "sets in_use to be true when touch_in called" do
        card.top_up(1)
        card.touch_in(station)
        expect(card.in_journey?).to be true
      end
    end

    context 'with insufficient balance' do
      it 'raises an error' do
        expect { card.touch_in(station) }.to raise_error "Insufficient balance."
      end
    end

    it "shows the entry station when the user touches in" do
      card.top_up(1)
      card.touch_in(station)
      expect(card.entry_station).to eq station
    end


  end

  describe '#touch_out' do
    it "sets in_use to false when card is touched out" do
      card.touch_out(station)
      expect(card.in_journey?).to be false
    end

    it "deducts minimum fare from balance when thouching out" do
      card.top_up(10)
      expect {card.touch_out(station) }.to change(card, :balance).by(-1)
    end

    it "sets entry_station to nil when card touched out" do
      card.touch_out(station)
      expect(card.entry_station).to eq nil
    end

    
  end

  describe '#journeys' do
    let(:journey){ {"entry_station" => station, "exit_station" => station} }
     
   it 'has an empty list of journeys by default' do
    expect(card.journeys).to be_empty
   end

   it 'creates one journey by touching in and touching out' do
    
    card.top_up(10)
    card.touch_in(station)
    card.touch_out(station)
    expect(card.journeys).to eq journey
   end
  end
end
