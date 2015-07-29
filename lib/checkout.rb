require 'rules'

Item = Struct.new(:code, :name, :price)

class Checkout
  def initialize(pricing_rules)
    @items = []
    @pricing_rules = pricing_rules
  end

  def scan(item)
    @items << item
  end

  def total
    sum = 0
    total_price = @items.reduce(0) { |sum, item| sum + item.price } * 100
    @pricing_rules.each do |rule|
      total_price -= rule.apply(@items) * 100
    end
    return total_price / 100
  end
end
