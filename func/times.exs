defmodule Times do
  def double(n) do
    n * 2
  end

  def triple(n), do: n * 3

  def greet(greeting, name), do: (
    IO.puts greeting
    IO.puts "How're you doing, #{name}?"
  )

  def quadruple(n), do: n|>double()|>double()
  # do..end 形式はシンタックスシュガーでコンパイル時にdo: 形式に変換される
end
