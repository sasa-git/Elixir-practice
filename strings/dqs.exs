# String: P.124
dqs = "∂x/∂y"
String.length dqs |> IO.inspect

defmodule MyString do
  def each(str, func), do: _each(String.next_codepoint(str), func)
  defp _each({codepoint, rest}, func) do
    func.(codepoint)
    _each(String.next_codepoint(rest), func)
  end
  defp _each(nil, _), do: []
end
MyString.each "∂og", fn c -> IO.puts c end
