product = {
	"shirt" => 15,
	"pants" => 12,
	"belts" => 20,
	"socks" => 17
}

def purchase(inven,item,quantity)
	inven[item] = inven[item] - quantity
	return inven
end

begin
	product.each do |i,q|
		puts "#{i}: (#{q} in stock)"
	end

	puts "Choose and item!"
	order = gets.chomp.downcase
	if product.has_key?(order) == false
		puts "Sorry we do not have the item you want. Please enter a valid item." 
		order = gets.chomp.downcase
	end

	puts "How many would you like to purchase?"
	order_num = gets.to_i

	puts "You ordered #{order_num} #{order}."

	product = purchase(product,order,order_num)

	puts "Would you like to make more purchase? Enter Y or N:"
	more = gets.chomp.downcase
	
	if more == "y"
		i = true
	else
		i = false
	end
end until i == false

puts product