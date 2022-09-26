class Auction
  attr_reader :items
  
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.find_all do |item|
      item.bids == {}
    end
  end

  def potential_revenue
    @items.sum do |item|
      if item.bids == {}
        item = 0
      else
        item.current_high_bid       
      end
    end
  end

  def bidders
    bidders = []
    @items.each do |item|
      item.bids.each do |attendee, bid|
        bidders << attendee.name
      end
    end
    bidders.uniq
  end

  def bidder_info
    bidder_information = Hash.new { |h, k| h[k] = { :budget => 0, :items => []}}
    @items.each do |item|
      item.bids.each do |attendee, bid|
        bidder_information[attendee][:budget] = attendee.budget
        bidder_information[attendee][:items] << item
      end
    end
    bidder_information
  end

  def date
    Date.today.strftime("%d/%m/%Y")
  end

  # def close_auction
  #   sold_items = {}
  #   @items.each do |item|
  #     sorted_bids = item.bids.sort_by do |attendee, bid|
  #       -bid
  #     end
  #     if sorted_bids[0][0].budget > sorted_bids[0][1]
  #       sold_items[item] = sorted_bids[0][0]
  #     end
  #   end
  #   require 'pry'; binding.pry
  #   sold_items
  # end
end