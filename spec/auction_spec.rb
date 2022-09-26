require 'spec_helper'

RSpec.describe Auction do
  before (:each) do
    @auction = Auction.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@auction).to be_instance_of(Auction)
    end

    it 'has no items to start' do
      expect(@auction.items).to eq([])
    end
  end
end