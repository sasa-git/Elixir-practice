add_n = fn n -> (fn other -> n + other end) end
add_two = add_n.(2)
add_five = add_n.(5)

add_two.(3) |> IO.puts()
add_five.(7) |> IO.puts()

#
# functions-4
#
prefix = fn prefix -> (fn name -> prefix <> " " <> name end) end
mrs = prefix.("Mrs")
mrs.("Smith") |> IO.puts()
prefix.("Elixir").("Rocks!!!") |> IO.puts()

prefix2 = fn prefix -> (fn name -> "#{prefix} #{name}" end) end
prefix2.("Elixir").("Sasa") |> IO.puts()


#
times_2 = fn n -> n * 2 end
apply = fn (fun, value) -> fun.(value) end 
apply.(times_2, 6) |> IO.puts()


# 関数パラメータはピンで固定"^"できる
defmodule Greeter do
  def for(name, greeting) do
    fn
      (^name) -> "#{greeting} #{name}"
      (_)     -> "I don't know you"
    end
  end
end

mr_valim = Greeter.for("Jose", "Oi!")
IO.puts mr_valim.("Jose")
IO.puts mr_valim.("Sasa")


# &記法
add_one = &(&1 + 1)
add_one.(44) |> IO.puts
square = &(&1 * &1)
square.(8) |> IO.puts
speak = &(IO.puts(&1))
speak.("Hello")
concat_list = &(&1 <> &2)
concat_list.("Hello", "Sasa") |> IO.puts
# リスト[]やタプル{}はElixirでは関数だから、リストやタプルのリテラルは関数に変換できる
div_rem = &{ div(&1, &2), rem(&1, &2) }
{div, rem} = div_rem.(13, 5)
IO.puts("#{div}...#{rem}")

s = &("bacon and #{&1}")
s.("egg") |> IO.puts

# run in iex
match_end = &~r/.*#{&1}$/
"cat" =~ match_end.("t")
"dog" =~ match_end.("!")

# run in iex 色々な&の使い方
l = &length/1
l.([1,2,3,4])
len = &Enum.count/1
len.([4,5,6,7])
m = &Kernel.min/2
m.(99, 88)
Enum.map [1,2,3,4,5], &(&1 < 3) 

#
# function-5
# run in iex
Enum.map [1,2,3,4], &(&1 + 2)
Enum.each [1,2,3,4], &(IO.inspect &1)

# アリティ：パラメータの数