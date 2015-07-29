class BuyOneGetOneFreeRule
  def initialize(product)
    @product = product
  end

  def apply(items)
    occurences = items.count { |item| item.code == @product.code } / 2
    return occurences * @product.price
  end
end

class BulkPurchaseRule
  def initialize(product, discount_percentage=10, limit=3)
    @product = product
    @discount_percentage = discount_percentage
    @limit = limit
  end

  def apply(items)
    occurences = items.count { |item| item.code == @product.code }
    return 0 if occurences < @limit

    return occurences * @product.price * @discount_percentage / 100
  end
end
