require 'pry'



class CashRegister
  attr_accessor :discount, :total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @@items = []
    @@item_hash = {}
    @last_item_added = {}
  end

  def add_item(title, price, quantity = 1)
    counter = 0
    while counter < quantity
      @@items << title
      counter += 1
    end
    self.total += (price * quantity)
    @last_item_added = {
      :title => title,
      :price => price,
      :quantity => quantity
    }
  end

  def apply_discount
    if discount != 0
      discount = (100.00 - self.discount) / 100.00
      self.total *= discount
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @@items
  end

  def void_last_transaction
    self.total -= @last_item_added[:price]
  end
end
