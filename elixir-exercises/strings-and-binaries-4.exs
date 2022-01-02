defmodule StringCalc do
  def calculate(chars) do
    [a, op, b] = _parse_tokens(chars, [[]])
    _calculate(List.to_integer(a), List.to_integer(b), op)
  end

  defp _calculate(a, b, op) when op === '+', do: a + b
  defp _calculate(a, b, op) when op === '-', do: a - b
  defp _calculate(a, b, op) when op === '*', do: a * b
  defp _calculate(a, b, op) when op === '/', do: a / b

  defp _parse_tokens([], tokens), do: tokens

  defp _parse_tokens([head | tail], [ lhs ]) when head in ?0..?9 do
    _parse_tokens(tail, [ lhs ++ [head] ])
  end

  defp _parse_tokens([head | tail], [ lhs, op, rhs ]) when head in ?0..?9 do
    _parse_tokens(tail, [ lhs, op, rhs ++ [head] ])
  end

  defp _parse_tokens([head | tail], tokens) when head === ?\s do
    _parse_tokens(tail, tokens)
  end

  defp _parse_tokens([head | tail], [ lhs ]) when head in '+-*/' do
    _parse_tokens(tail, [ lhs, [head], [] ])
  end
end

IO.inspect StringCalc.calculate('123 + 27')


# https://blog.panicblanket.com/archives/3759
defmodule Calculater do
  def calculate(charlist) do
    parse(charlist)
    |> calc
  end
  defp parse(charlist) do
    tokenize(charlist, [[]])
    |> _parse
  end
  defp tokenize([], result) do
    Enum.reverse(result)
  end
  defp tokenize([32|tail], result) do
    tokenize(tail, [[] | result])
  end
  defp tokenize([head|tail], [cur|rest]) do
    tokenize(tail, [cur ++ [head] | rest])
  end
  defp _parse([opnd1, op, opnd2]) do
    num1 = number(opnd1, 0)
    num2 = number(opnd2, 0)
    {op, num1, num2}
  end
  defp number([], value) do
    value
  end
  defp number([digit|tail], value) do
    number(tail, value * 10 + digit - ?0)
  end
  defp calc({'+', n1, n2}), do: n1 + n2
  defp calc({'-', n1, n2}), do: n1 - n2
  defp calc({'*', n1, n2}), do: n1 * n2
  defp calc({'/', n1, n2}), do: n1 / n2
end
IO.puts Calculater.calculate('123 + 27')
IO.puts Calculater.calculate('123 - 23')
IO.puts Calculater.calculate('100 * 2')
IO.puts Calculater.calculate('100 / 5')