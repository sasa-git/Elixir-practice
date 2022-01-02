defmodule Str do
  def center(slist) do
    len = longest(slist)
    slist
    |> Enum.map(fn s -> _center(s, len) end)
    |> Enum.each(&IO.puts/1)
  end

  defp longest(slist) do
    slist
    |> Enum.map(&String.length/1)
    |> Enum.max
  end

  defp _center(str, len) do
    l = div(len - String.length(str), 2)
    String.duplicate(" ", l) <> str
  end
end


Str.center(["cat", "zebra", "elephant"])