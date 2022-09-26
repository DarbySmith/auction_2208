require 'spec_helper'

RSpec.describe Auction do
  before (:each) do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@auction).to be_instance_of(Auction)
    end

    it 'has no items to start' do
      expect(@auction.items).to eq([])
    end
  end

  describe '#add item' do
    it 'can add an item to the items array' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.items).to eq([@item1, @item2])
    end
  end
end