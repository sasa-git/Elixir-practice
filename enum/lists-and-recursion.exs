defmodule ListsAndRecursion do
  # def all?([], _), do: true
  # def all?([head | tail], func) do
  #   func.(head) && all?(tail, func)
  # end
  def all?(_, func \\ fn x -> !!x end)
  def all?([], _), do: true
  def all?([head | tail], func), do: !!func.(head) && all?(tail, func)

  def each([head | []], func), do: func.(head)
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  # def filter([head | []], func) do
  #   if func.(head) do
  #     [head]
  #   else
  #     []
  #   end
  # end
  # def filter([head | tail], func) do
  #   if func.(head) do
  #     [head | filter(tail, func)]
  #   else
  #     filter(tail, func)
  #   end
  # end
  def filter([], _), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def split(list, num), do: _split([], list, num)
  defp _split(list1, [], num), do: {list1, []}
  defp _split(list1, list2, 0), do: {list1, list2}
  defp _split(list1, [head2 | tail2], num) do
    _split(list1 ++ [head2], tail2, num - 1)
  end

  def take(list, num), do: _take([], list, num)
  defp _take(result, [], _), do: result
  defp _take(result, _, 0), do: result
  defp _take(result, [head | tail], num), do: _take(result ++ [head], tail, num - 1)

  def flatten([]), do: []
  def flatten([head | tail]), do: flatten(head) ++ flatten(tail)
  def flatten(value), do: [value]
end
# https://github.com/maxim/elixir-exercises/blob/master/functions-5.exs