# If we list all the natural numbers below 10 that are multiples of 3 or 5, 
# we get 3, 5, 6 and 9. The sum of these multiples is 23.  Find the sum of 
# all the multiples of 3 or 5 below 1000.

# each
sum = 0
(1...1000).each { |x| sum += x if x.modulo(3) == 0 || x.modulo(5) == 0 }
puts sum #233168

# inject
# puts (1...1000).inject(0) {|sum, n| n = 0 unless n%3==0 || n%5==0; sum +=n}
