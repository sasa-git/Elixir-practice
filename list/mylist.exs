defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]

  def add_1([]), do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def reduce([], value, _func), do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)

  def mapsum([], _func), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def max(list), do: _max(list, hd(list))
  defp _max([], value), do: value
  defp _max([head | tail], value) when value > head, do: _max(tail, value)
  defp _max([head | tail], value) when value <= head, do: _max(tail, head)

  def ceasar([], _), do: []
  def ceasar([head | tail], n), do: [_calc(head, n) | ceasar(tail, n)]
  defp _calc(head, n) when head + n >= ?a and head + n <= ?z, do: head + n
  defp _calc(head, n) when n < 0, do: ?z + rem(head + n - ?z, 26)
  defp _calc(head, n), do: ?a + rem(head + n - ?z, 26) - 1

  # def span(from, to), do: [from | span_helper(from, to)]
  # def span_helper(num, num), do: []
  # def span_helper(num, to) when num < to, do: [num + 1 | span_helper(num + 1, to)]
  # def span_helper(num, to) when num > to, do: [num - 1 | span_helper(num - 1, to)]

  def span(from, to) when from == to, do: [from]
  def span(from, to) when from < to, do: [from | span(from + 1, to)]
  def span(from, to) when from > to, do: [from | span(from - 1, to)]

end

# iex(104)> MyList.reduce([1,2,3,4,5], 1, &(&1 * &2))
# 120
# iex(105)> MyList.reduce([1,2,3,4,5], 0, &(&1 + &2))
# 15
# iex(111)> MyList.mapsum([1,2,3], &(&1 * &1))
# 14

defmodule Swapper do
  def swap([]), do: []
  def swap([a, b | tail]), do: [b, a | swap(tail)]
  def swap([_]), do: raise "Can't swap a list with an odd number of elements"
end

defmodule WeatherHistory do
  def for_location_27([]), do: []
  def for_location_27([ [time, 27, temp, rain] | tail ]) do
    [ [time, 27, temp, rain] | for_location_27(tail) ]
  end
  def for_location_27([ _ | tail ]), do: for_location_27(tail)
  def test_data do
    [
      [1266225622, 26, 15, 0.125],
      [1266225623, 27, 15, 0.45],
      [1266225624, 28, 21, 0.25],
      [1266225625, 27, 15, 0.12],
      [1266225626, 22, 18, 0.64],
      [1266225627, 27, 16, 0.35],
      [1266225628, 26, 20, 0.22]
    ]
  end

  def for_location([], _target_loc), do: []
  def for_location([ [time, target_loc, temp, rain] | tail ], target_loc) do
    [ [time, target_loc, temp, rain] | for_location(tail, target_loc) ]
  end
  def for_location([ _ | tail ], target_loc), do: for_location(tail, target_loc)
end

defmodule WeatherHistory2 do
  def for_location([], _target_loc), do: []
  # パターンの中でパターンをマッチさせている
  def for_location([ head = [_, target_loc, _, _] | tail ], target_loc) do
    [head | for_location(tail, target_loc)]
  end
  def for_location([ _ | tail], target_loc), do: for_location(tail, target_loc)
end