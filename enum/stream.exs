# P.103
[1,2,3,4]
|> Stream.map(&(&1 * &1))
|> Stream.map(&(&1 + 1))
|> Stream.filter(fn x -> rem(x, 2) == 1 end)
|> Enum.to_list
|> IO.inspect

# IO.stream: IOデバイス(開いたファイル)を一度に1行ずつストリームに変換する
IO.puts File.open!("/usr/share/dict/words")
        |> IO.stream(:line)
        |> Enum.max_by(&String.length/1)
# ショートカット
IO.puts File.stream!("/usr/share/dict/words") |> Enum.max_by(&String.length/1)

Stream.cycle(~w{ green white })
|> Stream.zip(1..5)
|> Enum.map(fn {class, value} -> "<tr class='#{class}'><td>#{value}</td></tr>\n" end)
|> IO.puts

Stream.repeatedly(fn -> true end) |> Enum.take(3) |> IO.inspect
Stream.repeatedly(&:random.uniform/0) |> Enum.take(3) |> IO.inspect

# Stream.iterate(start_value, next_fun)
Stream.iterate(0, &(&1 + 1)) |> Enum.take(5) |> IO.inspect
Stream.iterate(2, &(&1 * &1)) |> Enum.take(5) |> IO.inspect
Stream.iterate([], &[&1]) |> Enum.take(5) |> IO.inspect

# fn state -> {stream_value, new_state} end
Stream.unfold({0, 1}, fn {f1, f2} -> {f1, {f2, f1+f2}} end) |> Enum.take(15) |> IO.inspect
# 新しい状態になると順番が一つずつずれていく。{f1, f2} という状態は、{f2, f1+f2}になる P.107

# Stream.resource     P.107

