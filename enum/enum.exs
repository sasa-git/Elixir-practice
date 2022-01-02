import Enum
deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit, rank]
deck |> shuffle |> take(13) |> IO.inspect
