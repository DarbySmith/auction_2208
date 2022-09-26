require 'spec_helper'

RSpec.describe Item do
  before (:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    @auction = Auction.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@item1).to be_instance_of(Item)
    end

    it 'has a name' do
      expect(@item1.name).to eq('Chalkware Piggy Bank')
    end

    it 'has no bids to start' do
      expect(@item1.bids).to eq({})
    end

    it 'can have bids by default' do
      expect(@item1.bidding_closed).to eq(false)
    end
  end

  describe '#add_bid' do
    it 'can add a bid on an item' do
      expect(@item1.bids).to eq({})
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      bids = {
        @attendee2 => 20,
        @attendee1 => 22
      }
      expect(@item1.bids).to eq(bids)
    end
  end

  describe '#current_high_bid' do
    it 'returns the highest bid' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      
      expect(@item1.current_high_bid).to eq(22)
    end
  end

  describe '#close_bidding' do
    it 'makes the item unable to receive additional bids' do
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      @item1.close_bidding
      @item1.add_bid(@attendee3, 70)
      bids = {
        @attendee2 => 20,
        @attendee1 => 22
      }
      expect(@item1.bids).to eq(bids)
    end
  end
end 