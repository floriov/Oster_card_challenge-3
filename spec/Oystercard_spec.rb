require 'Oystercard'

describe Oystercard do

  it "checks the cards balance is initialized at 0" do
    card = Oystercard.new
    expect(card.balance).to eq 0
  end
  
end