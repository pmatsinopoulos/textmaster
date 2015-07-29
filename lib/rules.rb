class BuyOneGetOneFreeRule
  def initialize(product)
    @product = product
  end

  def apply(items)
    occurences = items.count { |item| item.code == @product.code }
    discount = occurences / 2
    return discount * @product.price
  end
end
