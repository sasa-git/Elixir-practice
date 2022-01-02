defmodule Word do
  # 微妙
  def anagram?(word1, word2) do
    Enum.reverse(word2) === word1
  end

  # 微妙
  def anagram2([], _) do
    raise "not empty!"
  end
  def anagram2(word1, word2) when length(word1) == length(word2) do
    func(word1, word2)
  end
  defp func([head | tail], word2) do
    word2_touple = MapSet.new(word2)
    if MapSet.member?(word2_touple, head) do
      word2_touple = MapSet.delete(word2_touple, head)
      func(tail, word2_touple)
    else
      false
    end
  end
  defp func([], _) do
    true
  end

  # これが一番正解
  def true_anagram(word1, word2) do
    Enum.sort(word1) == Enum.sort(word2)
  end
end

# IO.inspect Word.anagram?('bat', 'tab')
# IO.inspect Word.anagram2('obake', 'akebo')
# IO.inspect Word.anagram2('obaka', 'akebo')
# IO.inspect Word.anagram2([], 'akebo')
IO.inspect Word.true_anagram('hello', 'olleh')