require 'pry'

class CashRegister

	attr_accessor :discount, :total, :items_array

	


	def initialize(discount=nil)
		@discount = discount
		@total = 0 
		@items_array = []
	end

	def add_item(*args)
		item = Item.new(args[0],args[1])
		if args.size == 2 
			 self.total += item.price 
			 self.items_array<<item
		else 
			 self.total += (item.price*args[2])
			 args[2].times do
				self.items_array<<item
			end
		end
				
	end

	def apply_discount
		if discount == nil 
		 "There is no discount to apply."
		  else 
		 @total -= @total*@discount/100
		  "After the discount, the total comes to $#{@total}."
		end	 	
	end

	def items
		self.items_array.map do |item_object|
			item_object.name
		end
	end

	def void_last_transaction
		self.total -= self.items_array[-1].price
	end


###################################################################
#						INNER CLASS ITEM 
###################################################################
	class Item

		attr_accessor :name, :price

		def initialize(name, price)
			@name, @price = name, price
		end

	end

end	






