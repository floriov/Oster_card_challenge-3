require 'Oystercard'

describe Oystercard do

  it { is_expected.to have_attributes(balance: 0) }
  it { is_expected.to respond_to(:top_up).with(1).argument }

  # we want to test whether top_up method adds amount to balance
  describe '#top_up' do
    it 'adds to balance when topping up' do
      #arrange
      subject.top_up(40)
      subject.top_up(20)
      #assert
      expect(subject.balance).to eq 40
    end
  end
end