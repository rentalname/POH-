n = gets

puts [n, *n.split("")].map(&:to_i).inject(:+)
