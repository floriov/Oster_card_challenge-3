require 'Oystercard'

describe Oystercard do
  let(:card) { Oystercard.new }

  it { is_expected.to have_attributes(balance: 0) }
  it { is_expected.to respond_to(:top_up, :deduct).with(1).argument }
  it { is_expected.to respond_to(:touch_in) }

  describe '#top_up' do
    it "adds top_up amount to balance" do
      expect { card.top_up(40) }.to change(card, :balance).by(40)
    end
    it "throws an error if the top_up called would exceed the £90 limit of the balance" do
      expect { card.top_up(100) }.to raise_error"Balance cannot exceed £#{Oystercard::LIMIT_VALUE}"
    end
  end

  describe '#deduct' do
    it "deducts an amount from the balance" do
      card.top_up(45)

      expect { card.deduct(5) }.to change(card, :balance).by(-5)
    end
  end
end
