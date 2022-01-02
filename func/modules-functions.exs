# 浮動小数点を文字列に変換
# 小数点1文字含めて3文字分のフィールドで出力
# Erlang
:io.format("The number is ~3.1f~n", [5.678])

:io.format("The number is ~.2f~n", [123.12])
:io.format("The number is ~5.1f~n", [123.12])
:io.format("The number is ~6.2f~n", [123.12])

#
# note
#
# シーケンス	役割
# ~n	改行
# ~p	整形して出力を行なう
# ~s	文字列の出力を行なう
# ~w	データをそのまま出力する
# iex(42)> :io.format("input is ~p~n", ["sasa"])
# input is <<"sasa">>
# :ok
# iex(43)> :io.format("input is ~p~n", ['sasa'])
# input is "sasa"
# :ok
# iex(44)> :io.format("input is ~s~n", ['sasa'])
# input is sasa
# :ok
# iex(45)> :io.format("input is ~s~n", ["sasa"])
# input is sasa
# :ok
# iex(46)> is_list 'sasa'
# true
# iex(47)> is_list "sasa"
# false

# iex(40)> i 'sasa'
# Term
#   'sasa'
# Data type
#   List
# Description
#   This is a list of integers that is printed as a sequence of characters
#   delimited by single quotes because all the integers in it represent printable 
#   ASCII characters. Conventionally, a list of Unicode code points is known as a
#   charlist and a list of ASCII characters is a subset of it.
# Raw representation
#   [115, 97, 115, 97]
# Reference modules
#   List
# Implemented protocols
#   Collectable, Enumerable, IEx.Info, Inspect, List.Chars, String.Chars

# iex(41)> i "sasa"
# Term
#   "sasa"
# Data type
#   BitString
# Byte size
#   4
# Description
#   This is a string: a UTF-8 encoded binary. It's printed surrounded by
#   "double quotes" because all UTF-8 encoded code points in it are printable.
# Raw representation
#   <<115, 97, 115, 97>>
# Reference modules
#   String, :binary
# Implemented protocols
#   Collectable, IEx.Info, Inspect, List.Chars, String.Chars

# 環境変数を取り出す
IO.inspect(System.get_env)

# ファイル名の拡張子を取り出す
Path.extname("dave/test.exs") |> IO.inspect

#
# おまけ
#
# ファイル名を返す
Path.basename("dave/test.exs") |> IO.inspect
# ファイル名を、拡張子を消して返す
Path.basename("dave/test.exs", ".exs") |> IO.inspect

# 現在ディレクトリからの絶対パスを返す
Path.absname("dave/test.exs") |> IO.inspect
# path引数のディレクトリを返す
Path.dirname("dave/test.exs") |> IO.inspect
# 絶対パスへ変換
Path.expand("~/hoge/soni.exs") |> IO.inspect

# プロセスの作業ディレクトリを返す
File.cwd |> elem(1) |> IO.inspect

# JSONをElixirのデータ構造に変換する
# Jason(こっちのが今はメジャー), Poison
# https://github.com/michalmuskala/jason

# シェルでコマンドを実行(pwd/gitを使ってみよう)
:os.cmd('pwd') |> IO.inspect
System.cmd("date", []) |> IO.inspect


# iex(37)> :os.cmd("pwd") ←だとエラーになる
# ** (ArgumentError) errors were found at the given arguments:
#   * 1st argument: not a list of characters

# Elixirの外部にあるコマンドが存在するか確認
# iex(48)> System.find_executable("git")
# "/usr/local/bin/git"
System.cmd("git", ["--version"]) |> IO.inspect
:os.cmd('git --version') |> IO.inspect
