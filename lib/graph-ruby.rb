class GraphRuby

	def self.histogram(data)
		Histogram.new(data)
	end 

end


# my_hash = {a: 5, b: 6, c: 10, d: 2, e: 9}


class Histogram
	def initialize(my_hash = {}, axis = 1)
		@data = my_hash
		@axis = axis
		run
	end

	def run
		clear_screen
		calculate_padding
		print_heading
		print_value
		# convert_to_percentages
		# calculate_axis
		print_values
	end 
	
	def clear_screen
		puts "\e[H\e[2J"
	end 

	def print_heading
		@data.each do |key, value|
			print "%-#{@padding}s" % "#{key}" 
		end 
		puts ""
		puts "-"*((@data.length*@padding)-3)
	end 

	def print_value
		@data.each do |key, value|
			print "%-#{@padding}s" % "#{value}" 
		end 
		puts ""
	end

	def calculate_axis
		@data.each {|key, value| @data[key] = value}
	end 

	def convert_to_percentages
		sum = calculate_sum

		@data.each do |key, value|
			@data[key] = ((value.to_f)/(sum.to_f)*100).to_i
		end 
	end 

	def calculate_sum
		sum = 0
		@data.each do |key, value|
			sum += value
		end 
		return sum
	end


	def print_values
		all_zero = false
		while !all_zero
			all_zero = true
			@data.each do |key, value|
				if value > 0
					print print "%-#{@padding}s" % "X" 
					@data[key] -=1
					all_zero = false
				else
					print "%-#{@padding}s" % " " 
				end
			end 
			puts " "
		end
	end 


	def calculate_padding
		longest_length_sf = 0
		@data.each do |key, value|
			longest_length_sf = key.length if key.length > longest_length_sf
		end 

		@padding = longest_length_sf + 3
	end 



end 