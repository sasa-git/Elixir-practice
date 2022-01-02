defmodule Sales do
  def csv_to_list(filename) do
    {:ok, file} = File.open(filename, [:read])
    headers = (IO.read(file, :line) |> parse_csv_atom)
    IO.stream(file, :line)
    |> Enum.map(fn l -> parse_csv(l) end)
    |> Enum.map(fn sales -> Enum.zip(headers, sales) end)
  end

  defp parse_csv_atom(line) do
    String.trim(line, "\n")
    |> String.split(",")
    |> Enum.map(&String.to_atom/1)
  end

  defp parse_csv(line) do
    [id, ship_to, net_amount] = (String.trim(line, "\n") |> String.split(","))
    [String.to_integer(id), String.to_atom(String.trim(ship_to, ":")), String.to_float(net_amount)]
  end
end

IO.inspect Sales.csv_to_list("sales.csv")
# https://blog.panicblanket.com/archives/3767