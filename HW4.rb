@product = {
	"shirt" => 15,
	"pants" => 12,
	"belts" => 20,
	"socks" => 17
}

def purchase(item,quantity)
	@product[item] -= quantity
	return @product
end

begin
	@product.each do |i,q|
		puts "#{i}: (#{q} in stock)"
	end

	puts "Choose and item!"
	begin
		order = gets.chomp.downcase
		puts "Sorry we do not have the item you want. Please enter a valid item." if @product.has_key?(order) == false
	end until @product.has_key?(order) == true

	puts "How many would you like to purchase?"

	begin
		order_num = gets.to_i
		puts "Sorry, we do not have enough #{order} in stock. There are only #{@product[order]} left in the stock." if order_num > @product[order]
	end until order_num < @product[order]

	puts "You ordered #{order_num} #{order}."

	product = purchase(order,order_num)

	puts "Would you like to make more purchase? Enter Y or N:"
	more = gets.chomp.downcase
	
	if more == "y"
		i = true
	else
		i = false
	end
end until i == false

puts @product