require_relative 'graph-ruby'
require 'rspec'

data = {a: 3, "louie" => 7}

GraphRuby.histogram!(data: data, percent: true, axis: 10)

describe "validate" do 
end




describe "HistogramHelper" do
	context "calculate_axis" do 
		it "alters data values if axis > 0" do 
			data = {a: 10, b:20}
			hist = HistogramHelper.new(data, 10)
			hist.calculate_axis
			expect(hist.data).to eq({a: 1, b: 2})
		end

		it "does not alter data if axis < 1" do 
			data = {a: 10, b:20}
			hist = HistogramHelper.new(data, 0)
			hist.calculate_axis
			expect(hist.data).to_not eq({a: 1, b: 2})
		end 
	end 

	context "convert_to_percentages" do 
		it "turns data to percentages" do 
			data = {a: 3, b:7}
			hist = HistogramHelper.new(data)
			hist.convert_to_percentages
			expect(hist.data).to eq({a: 30, b: 70})
		end
	end

	context "calculate_sum" do 
		it "sums the values of the hash" do
			data = {a: 3, b:7}
			hist = HistogramHelper.new(data)
			
			expect(hist.calculate_sum).to eq(10)
		end 
	end 

	context "calculate_padding" do 
		it "adds 3 to the longest key length" do 
			data = {"test" => 3, b:7}
			hist = HistogramHelper.new(data)
			
			expect(hist.calculate_padding).to eq(7)
		end
	end 
end 

