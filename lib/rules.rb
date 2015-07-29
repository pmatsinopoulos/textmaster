class BuyOneGetOneFreeRule
  def initialize(product)
    @product = product
  end

  def apply(items)
    occurences = items.count { |item| item.code == @product.code } / 2
    return occurences * @product.price
  end
end
