# Preset Inventory
product = {
	"shirt" => 15,
	"pants" => 12,
	"belts" => 20,
	"socks" => 17
}
action = ["0 - Display Inventory", "1 - Purchase Item", "2 - Sell Item", "3 - Add Item", "4 - Remove Item", "5 - Exit"]

def disp(inventory)
	inventory.each do |i,q|
		puts "#{i}: (#{q} in stock)"
	end
end

def purchase(inventory,item,quantity)
	inventory[item] -= quantity
	return inventory
end

def sell(inventory,item,quantity)
	inventory[item] += quantity
	return inventory
end


while true
	# Prompt the user with the action list
	# Ensure User is entering valid reponse
	begin
		puts "Please select the action: \n"
		action.each do |act|
			puts act
		end
		response = gets.to_i
	end until response >= 0 && response < 6

	# Identify User's action
	if response == 0
		# Display the current inventory
		puts "\nThe current inventory is:"
		disp(product)

	elsif response == 1
		# Let user to make purchase
		puts "Which item would you like to purchase?"
		product.each_key {|key| print "#{key}\n"}
		order = gets.chomp.downcase
			while product.has_key?(order) == false
				puts "Sorry we do not have the item you want. Please enter a valid item." 
				order = gets.chomp.downcase
			end
		puts "How many would you like to purchase?"

		begin
			order_num = gets.to_i
			puts "Sorry, we do not have enough #{order} in stock. There are only #{product[order]} left in the stock." if order_num > product[order]
		end until order_num < product[order]

		puts "You ordered #{order_num} #{order}."

		product = purchase(product,order,order_num)

	elsif response == 2
		# Let user to sell item to the store
		puts "Which item would you like to sell?"
		sell_item = gets.chomp.downcase
		puts "How many would you like to sell?"
		sell_item_num = gets.to_i
		if product.has_key?(sell_item) == false
			product[sell_item] = sell_item_num
		else
			product = sell(product,sell_item,sell_item_num)
		end
		puts "You sold #{sell_item_num} #{sell_item} to the store."

	elsif response == 3
		# Let user to add item
		puts "What item would you like to add?"
		new_item = gets.chomp.downcase
		if product.has_key?(new_item) == false
			product[new_item] = 0
		else
			puts "Sorry, the item already exists.."
		end

	elsif response == 4
		# Let user to remove item
		puts "What item would you like to remove?"
		del_item = gets.chomp.downcase
		if product.has_key?(del_item) == true
			product.delete(del_item)
		else
			puts "Sorry, the item does not exist.."
		end

	else
		break  # if user choose to Exit
	end
	puts
end