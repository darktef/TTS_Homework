# Use Homedepot's directory as reference
class Commodity
	attr_accessor :model_num, :brand, :price
	def initialize(model_num, brand, price)
		@model_num = model_num
		@brand = brand
		@price = price
	end
	def des
		puts "Welcome to Homedepot! #{brand} #{model_num} is priced at #{price}."
	end
end

class Appliance < Commodity
	attr_accessor :width, :depth, :height
	def installation_fee
		if price < 499 
			(price * 1.15).round(2)
		else
			0
		end
	end
end

class Ranges < Appliance
	attr_accessor :fuel_type, :ignition_type, :weight
end

range = Ranges.new("NX58F5500SS", "Samsung",675)
range.des
puts "The installation fee for #{range.brand} #{range.model_num} of #{range.price} USD is #{range.installation_fee}."

class Refrigerator < Appliance
	attr_accessor :ice_maker, :esyo, :total_capacity
	def discount
		return "The #{brand} #{model_num} is current on sale now. The discounted price is #{(price * 0.9).round(2)}" if Time.now.month == 4
	end
end

freezer = Refrigerator.new("MBF1953DEM","Maytag",989.10)
puts freezer.discount

# Experimenting if superclass and subclass both have initilization, then how to construct new object
class LawnGarden < Commodity
end

class GardenPlants < LawnGarden
end

class Trees < GardenPlants
	attr_accessor :soil_condition, :sun_toler
	def initialize(soil_condition,sun_toler)
		@soil_condition = soil_condition
		@sun_toler = sun_toler
	end
	def disclaimer
		puts "This type of tree prefers #{soil_condition} soil condition. And the sun tolerance is #{sun_toler}"
	end
end

autumn_twist = Trees.new("acidic", "full sun")
autumn_twist.disclaimer
autumn_twist.model_num = "80563"
autumn_twist.brand = "Encore Azalea"
autumn_twist.price = 39.98
autumn_twist.des

