require 'checkout'

RSpec.describe Checkout do
  it 'calculates total from item price' do
    fr1 = Item.new('FR1', 'Fruit tea', 3.11)
    ap1 = Item.new('AP1', 'Apple', 5.00)
    cf1 = Item.new('CF1', 'Coffee', 11.23)

    co = Checkout.new([])
    co.scan(fr1)
    co.scan(ap1)
    co.scan(cf1)

    expect(co.total).to eq(19.34)
  end
end
