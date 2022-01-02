defmodule Chop do
  def guess(num, range) do
    min..max = range
    mid_num = div(max, 2)
    IO.puts "Is it #{mid_num}"
    helper(num, range, mid_num) #1 273, 1..1000, 500
  end
  def helper(num, range, estimate_num) when num > estimate_num do
    min..max = range
    mid_num = div(max - estimate_num, 2) + estimate_num
    IO.puts("Is it #{mid_num}")
    helper(num, estimate_num..max, mid_num) #3 273, 250..500, 375
  end
  def helper(num, range, estimate_num) when num < estimate_num do
    min..max = range
    mid_num = div(estimate_num - min, 2) + min
    IO.puts("Is it #{mid_num}")
    helper(num, min..estimate_num, mid_num) #2 273, 1..500, 250 #4 273, 250..375, 312
  end
  def helper(num, range, estimate_num) when num == estimate_num do
    IO.puts num
  end
end