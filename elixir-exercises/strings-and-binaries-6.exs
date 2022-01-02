defmodule Str do
  def capitalize(word) do
    String.to_charlist(word)
    |> to_upper([])
    |> to_string
  end

  defp to_upper([], result) do
    Enum.reverse(result)
  end
  defp to_upper([32|tail], result) do
    to_upper(tail, [32|result])
  end
  defp to_upper([?.|tail], result) do
    to_upper(tail, result)
  end
  defp to_upper([c|tail], result) do
    to_lower(tail, [upcase(c)|result])
  end
  defp upcase(c) when c <= ?Z, do: c
  defp upcase(c),              do: c - 32

  defp to_lower([], result) do
    Enum.reverse(result)
  end
  defp to_lower([32|tail], result) do
    to_lower(tail, [32|result])
  end
  defp to_lower([?.|tail], result) do
    to_upper(tail, [?.|result])
  end
  defp to_lower([c|tail], result) do
    to_lower(tail, [lowcase(c)|result])
  end
  defp lowcase(c) when c >= 97, do: c
  defp lowcase(c),              do: c + 32
end


IO.puts Str.capitalize("oh. a DOG. woof. ")