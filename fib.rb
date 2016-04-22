def fibonacci(n)
  nums = [0, 1]
  i = 2
  while i <= n
    nums.push(nums[i-1]+nums[i-2])
    i = i + 1
  end
  return nums[n]
end

puts fibonacci(6)

def fibonacci(n)
  if n == 0
    return 0
  elsif n == 1
    return 1
  else
    return (fibonacci(n-1) + fibonacci(n-2))
  end
end

puts fibonacci(7)