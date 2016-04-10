# rock, paper and scissor game
puts "Rock, paper and scissor with Computer!"
puts "Ready? Game Start! "
c = 0
h = 0
puts "Computer: #{c} VS You: #{h}"
choice = ["rock","paper","scissor"]

until c == 5 || h == 5
	# c stands for the winning score of computer, while h stands for the winning score of human
	puts "\nYour choice? 1 stands for rock, 2 stands for paper and 3 stands for scissor:"
	guess = gets.to_i
	puts "Your guess's #{choice[guess-1]}"
	comp_guess = rand(3) + 1
	puts "Computer guess's #{choice[comp_guess-1]}"

	diff = (comp_guess-guess+3)%3
	if diff == 1
		c +=1
	elsif diff == 2
		h +=1
	else
		puts "Draw. That is intense!"
	end
	puts "Computer: #{c} VS You: #{h}!"
	puts "----------Next Round----------"
end

if c == 5
	puts "\nOops..Computer Wins."
else
	puts "\nCongrats!You Wins!"
end

=begin
	intuitive way to do this
	diff = comp_guess - guess
	if diff == 1 || diff == -2
		c += 1
	elsif diff == 2 || diff == -1
		h += 1
	else 
		puts "That's draw!"
	end	
=end