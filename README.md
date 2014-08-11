#graph-ruby

<strong>graph-ruby</strong> is a Ruby gem that allows you to graph items without leaving the terminal. You don't need JavaScript and you don't need the browser.

See the gem homepage [here](https://rubygems.org/gems/graph-ruby/).
##Setup

In the terminal run 
```ruby
gem install graph-ruby
```

Add the following to the top of your Ruby file
```ruby
require 'graph-ruby'
```

##Usage 

###Simple Histogram

```ruby
# You must store your data as a hash
points = {me: 8, you: 6}
# You must pass in the data as a hash
GraphRuby.histogram{data: points}

# If you want it to clear the screen before it prints the graph use a bang (!)
GraphRuby.histogram!{data: points}
```
![Simple Histogram](/images/simpleHistogram.png?raw=true "Simple Histogram")

###Percentage Histogram

```ruby

points = {me: 8, you: 6}

# The histogram will graph the percentage of the values
GraphRuby.histogram{data: points, percent: true}

```
![Percentage Histogram](/images/percentageHistogram.png?raw=true "Percentage Histogram")
###Change the axis

```ruby

points = {me: 80, you: 60}

# The Xs in this histogram will each have a value of 10.
# So "me" will have 8 Xs, and "you" will have 6 Xs. Ha, I win.
GraphRuby.histogram{data: points, axis: 10}

```
![changedAxis Histogram](/images/changedAxisHistogram.png?raw=true "changedAxis Histogram")