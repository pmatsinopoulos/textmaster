Item = Struct.new(:code, :name, :price)

class Checkout
  def initialize(pricing_rules)
    @items = []
  end

  def scan(item)
    @items << item
  end

  def total
    sum = 0
    @items.each do |item|
      sum += item.price
    end
    return sum
  end
end

