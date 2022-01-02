cast = %{
  buttercup: %{
    actor: {"Robin", "Wright"},
    role: "princess"
  },
  westley: %{
    actor: {"Carey", "Elwes"},
    role: "farm boy"
  }
}

# key() key!()は辞書型(マップと構造体)で使える

IO.inspect get_in(cast, [Access.key(:westley), :actor, Access.elem(1)])

IO.inspect get_and_update_in(cast, [Access.key(:buttercup), :role], fn (val) -> {val, "Queen"} end)