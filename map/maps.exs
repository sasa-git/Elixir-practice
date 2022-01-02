people = [
  %{ name: "sasa", height: 1.54 },
  %{ name: "hoge", height: 1.23 },
  %{ name: "fuga", height: 1.64 },
  %{ name: "piyo", height: 1.13 },
  %{ name: "bone", height: 1.55 },
  %{ name: "tall", height: 2.11 },
]

# p.86 height, personにバインド→フィルタリング
IO.inspect(for person = %{height: height} <- people, height > 1.5, do: person)

defmodule HotelRoom do
  
  def book(%{name: name, height: height})
  when height > 1.9 do
    IO.puts "Need ex-long bed for #{name}"
  end

  def book(%{name: name, height: height})
  when height < 1.3 do
    IO.puts "Need low shower controls for #{name}"
  end

  def book(person) do
    IO.puts "Need regular bed for #{person.name}"
    # IO.puts "Need regular bed for #{person[:name]"
  end
end

people |> Enum.each(&HotelRoom.book/1)