class CashRegister
  attr_accessor :total
  attr_accessor :discount
  attr_accessor :items
  
  def initialize(discount=nil)
    @total = 0
    @discount=discount
    @items=[]
  end
  
  def void_last_transaction
    @total-=@transaction
    @items.pop
  end
  def apply_discount
    return "There is no discount to apply." unless discount
    @total-=@transaction*(@discount/100.0)
    "After the discount, the total comes to $#{(@transaction*((100-@discount)/100.0)).round(0)}."
  end
  def add_item(name, price, number=1)
    @transaction=(price*number).round(2)
    @total+=@transaction
    number.times do 
      @items.push(name)
    end
  end
end