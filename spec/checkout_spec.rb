require 'checkout'

RSpec.describe Checkout do
  def fruit_tea
    Item.new('FR1', 'Fruit tea', 3.11)
  end

  def apple
    Item.new('AP1', 'Apple', 5.00)
  end

  def coffee
    Item.new('CF1', 'Coffee', 11.23)
  end

  it 'calculates total from item price' do
    pricing_rules = []

    co = Checkout.new(pricing_rules)
    co.scan(fruit_tea)
    co.scan(apple)
    co.scan(coffee)

    expect(co.total).to eq(19.34)
  end

  it 'applies buy-one-get-one-free offers with 2 fruits tea' do
    pricing_rules = [
      BuyOneGetOneFreeRule.new(fruit_tea)
    ]

    co = Checkout.new(pricing_rules)
    co.scan(fruit_tea)
    co.scan(fruit_tea)

    expect(co.total).to eq(3.11)
  end

  it 'applies buy-one-get-one-free offers with 3 fruits tea' do
    pricing_rules = [
      BuyOneGetOneFreeRule.new(fruit_tea)
    ]

    co = Checkout.new(pricing_rules)
    co.scan(fruit_tea)
    co.scan(fruit_tea)
    co.scan(fruit_tea)

    expect(co.total).to eq(6.22)
  end

  it 'applies buy-one-get-one-free offers on coffee' do
    pricing_rules = [
      BuyOneGetOneFreeRule.new(coffee)
    ]

    co = Checkout.new(pricing_rules)
    co.scan(coffee)
    co.scan(coffee)

    expect(co.total).to eq(11.23)
  end

  it 'applies buy-one-get-one-free offers on coffee and fruit tea' do
    pricing_rules = [
      BuyOneGetOneFreeRule.new(coffee),
      BuyOneGetOneFreeRule.new(fruit_tea)
    ]

    co = Checkout.new(pricing_rules)
    co.scan(coffee)
    co.scan(fruit_tea)
    co.scan(coffee)
    co.scan(fruit_tea)

    expect(co.total).to eq(14.34)
  end

  it 'does not apply bulk purchase discount for 2 apples' do
    pricing_rules = [
      BulkPurchaseRule.new(apple)
    ]

    co = Checkout.new(pricing_rules)
    co.scan(apple)
    co.scan(apple)

    expect(co.total).to eq(10)
  end

  it 'applies bulk purchase discount for 3 apples' do
    pricing_rules = [
      BulkPurchaseRule.new(apple)
    ]

    co = Checkout.new(pricing_rules)
    co.scan(apple)
    co.scan(apple)
    co.scan(apple)

    expect(co.total).to eq(13.50)
  end

  it 'applies bulk purchase discount for 10 apples' do
    pricing_rules = [
      BulkPurchaseRule.new(apple)
    ]

    co = Checkout.new(pricing_rules)
    10.times { co.scan(apple) }

    expect(co.total).to eq(45)
  end

  it 'applies 50% bulk purchase discount for more than 5 apples' do
    pricing_rules = [
      BulkPurchaseRule.new(apple, 50, 5)
    ]

    co = Checkout.new(pricing_rules)
    10.times { co.scan(apple) }

    expect(co.total).to eq(25)
  end
end
