class GraphRuby

	def self.histogram!(args)
		View.clear_screen
		self.histogram(args)
	end 

	def self.histogram(args)

		data = args[:data]
		percent = args[:percent] || false
		axis = args[:axis] || 1

		hist = HistogramHelper.new(data)
		header_padding = hist.padding
		View.print_heading(data, header_padding)
		
		hist.convert_to_percentages if(percent)
			
		View.print_numerical_value(data, header_padding)
		hist.calculate_axis(axis)
		View.print_marks(data, header_padding)
	end 

end


# my_hash = {a: 5, b: 6, c: 10, d: 2, e: 9}
class View

	def self.clear_screen
		puts "\e[H\e[2J"
	end 

	def self.print_heading(data, padding)
		data.each do |key, value|
			print "%-#{padding}s" % "#{key}" 
		end 
		puts ""
		puts "-"*((data.length*padding)-3)
	end 

	def self.print_numerical_value(data, padding)
		data.each do |key, value|
			print "%-#{padding}s" % "#{value}" 
		end 
		puts ""
	end

	def self.print_marks(data, padding)
		all_zero = false
		while !all_zero
			all_zero = true
			data.each do |key, value|
				if value > 0
					print print "%-#{padding}s" % "X" 
					data[key] -=1
					all_zero = false
				else
					print "%-#{padding}s" % " " 
				end
			end 
			puts " "
		end
	end 

end 



class HistogramHelper

	attr_reader :padding

	def initialize(my_hash = {}, axis = 1)
		@data = my_hash
		@axis = axis
		@padding = calculate_padding
	end


	def calculate_axis(value_per_mark)
		@data.each {|key, value| @data[key] = value/value_per_mark}
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




	def calculate_padding
		longest_key_length = 0
		@data.each do |key, value|
			longest_key_length = key.length if key.length > longest_key_length
		end 

		return longest_key_length + 3
	end 



end 





