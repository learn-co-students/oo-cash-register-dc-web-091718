require 'pry'

class CashRegister

  attr_accessor :discount, :total, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(name, price, quantity=1)
    @total += price * quantity
    quantity.times do
      @items << name
    end
  end

  def apply_discount
    if discount > 0
      # Convert discount value to a float
      discount_as_float = discount.to_f * 0.01
      @total -= @total * discount_as_float

      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

end