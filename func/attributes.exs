defmodule Example do
  @author "Dave Thomas"
  def get_author, do: @author
end

# モジュールでは同じ属性(@attr)に何度も値を設定することができる。
# 関数のメタデータや設定など、定数として使うことが多いP.68
# 属性にアクセスするときは、関数が定義された時に有効な値を取る
defmodule Example2 do
  @attr "one"
  def first, do: @attr
  @attr "two!"
  def second, do: @attr
end