Item = Struct.new(:code, :name, :price)

class Checkout
  def initialize(pricing_rules)
    @items = []
  end

  def scan(item)
    @items << item
  end

  def total
    @items.reduce(0) { |sum, item| sum + item.price }
  end
end

