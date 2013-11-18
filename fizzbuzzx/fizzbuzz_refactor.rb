def fizzbuzz(num)

	if num.is_a? Integer

		if 0 < num && num < 101
			
			if (num % 3 != 0) && (num % 5 != 0)
				num
			elsif (num % 15 == 0)
				"fizzbuzz"
			elsif (num % 3 == 0) 
				"fizz"
			else
				"buzz"
			end
		
		else
			puts "Sorry, that number is not between 0 and 101."
		
		end

	else
		puts "Sorry, that was not an integer."

	end

end

# 101.times do |i|
# 	if i == 0
#         print ""
# 	elsif (i % 3 != 0) && (i % 5 != 0)
# 		puts i
# 	elsif (i % 3 == 0) && (i % 5 == 0)
# 		puts "fizzbuzz"
# 	elsif (i % 3 == 0) 
# 		puts "fizz"
# 	elsif (i % 5 == 0) 
# 		puts "buzz"
# 	end

# end