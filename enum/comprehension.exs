# 内包表記: P.111

for x <- [1,2,3,4,5], do: x*x |> IO.inspect
for x <- [1,2], y <- [5,6], do: {x, y} |> IO.inspect

# intoパラメータ 内包表記の結果を受け取る。
# デフォルトで、これまでの例では内包表記はリストを返していた。do式の返り血が収められる
for x <- ~w{ dog cat }, do: {x, String.upcase(x)}
# [{"dog", "DOG"}, {"cat", "CAT"}]
for x <- ~w{ dog cat }, into: %{}, do: {x, String.upcase(x)}
# %{"cat" => "CAT", "dog" => "DOG"}
for x <- ~w{ dog cat }, into: Map.new, do: {x, String.upcase(x)}
# %{"cat" => "CAT", "dog" => "DOG"}
for x <- ~w{ dog cat }, into: %{"ant" => "ANT"}, do: {x, String.upcase(x)}
# %{"ant" => "ANT", "cat" => "CAT", "dog" => "DOG"}
for x <- ~w{ dog cat }, into: IO.stream(:stdio, :line), do: "<<#{x}>>\n"

# ListsAndRecursion-7
defmodule MyList do
  def span(from, to) when from == to, do: [from]
  def span(from, to) when from < to, do: [from | span(from + 1, to)]
  def span(from, to) when from > to, do: [from | span(from - 1, to)]
end
# x は2..x-1までの数字vで全てrem(x, v) > 0となるか？
primes = for x <- MyList.span(2, 40),
  Enum.all?(
    MyList.span(2, Enum.max([2, x-1])),
    fn v -> rem(x, v) > 0 end
  ), do: x

IO.inspect primes