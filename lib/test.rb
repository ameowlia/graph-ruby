require_relative 'graph-ruby'

data = {a: 3, "louie" => 7}

GraphRuby.histogram!(data: data, percent: true, axis: 10)


