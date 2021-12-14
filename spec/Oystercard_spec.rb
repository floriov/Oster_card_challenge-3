require 'Oystercard'

describe Oystercard do
  let(:card) { Oystercard.new }

  it { is_expected.to have_attributes(balance: 0) }
  it { is_expected.to respond_to(:top_up).with(1).argument }

  # we want to test whether top_up method adds amount to balance
  describe '#top_up' do
    it "adds top_up amount to balance" do
      expect { card.top_up(40) }.to change(card, :balance).by(40)
    end
    it "throws an error if the top_up called would exceed the £90 limit of the balance" do
      limit_value = LIMIT_VALUE
      expect { card.top_up(100) }.to raise_error"Balance can not exceed #{limit_value}"
    end
  end
end
