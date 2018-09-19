class CashRegister
	attr_accessor :total, :discount
	attr_reader :items, :last_transaction

	def initialize(discount=0)
		@total = 0.0
		@discount = discount
		@items = []
	end

	def add_item(title, price, quantity=1)
		total_price = price * quantity	
		@total += total_price
		@last_transaction = total_price
		quantity.times {items << title}

	end

	def apply_discount
		if @discount == 0
			return "There is no discount to apply."
		end
		@total *= (100 - @discount) * 0.01
		"After the discount, the total comes to $#{@total.to_i}."
	end

	def void_last_transaction
		@total -= last_transaction
		
	end

end