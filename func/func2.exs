
func2 = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, num -> Integer.to_string(num)
end

IO.puts("(0, 0, 1): #{func2.(0, 0, 1)}")
IO.puts("(0, 1, 1): #{func2.(0, 1, 1)}")
IO.puts("(1, 0, 1): #{func2.(1, 0, 1)}")
IO.puts("(5, 0, 0): #{func2.(5, 0, 0)}")
IO.puts("(1, 1, 5): #{func2.(1, 1, 5)}")

func3 = fn
  n -> func2.(rem(n, 3), rem(n, 5), n)
end

# IO.puts(func3.(15))
IO.puts("func3(10): #{func3.(10)}")
IO.puts("func3(12): #{func3.(12)}")
IO.puts("func3(13): #{func3.(13)}")
IO.puts("func3(15): #{func3.(15)}")
res = Enum.map((10..16), func3) |> Enum.join(", ")
IO.puts(res)