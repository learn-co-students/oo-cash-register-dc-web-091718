class CashRegister

  attr_accessor :total, :discount, :items, :last_item_price

  def initialize(employee_discount = nil)
    @discount = employee_discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity = 1)


    for i in 1..quantity do
      self.total  += price
      self.items << title
      self.last_item_price = price
    end
  end

  def apply_discount
    if self.discount
      self.total = self.total - self.total * self.discount / 100
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_item_price
  end

end
