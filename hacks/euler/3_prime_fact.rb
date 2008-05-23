# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

def prime_fact(num)
  while ((num % 2) == 0)
    puts num
    num = num / 2
  end

  i = 3;
  while (i <= Math::sqrt(num)+1)
    if ((num % i) ==0)
      puts i
      num = num / i
    else
      i = i + 2
    end
  end

  if (num > 1)
    puts num
  end
end

prime_fact(13195)
prime_fact(600851475143)

