defmodule Elen.Randomizer do

  def randomize(length) do
    lists = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" ]
    do_randomize(length, lists)
  end

  defp get_range(length) when length > 1, do: (1..length)
  defp get_range(_length), do: [1]

  defp do_randomize(length, lists) do
    get_range(length)
    |> Enum.reduce([], fn(_, acc) -> [Enum.random(lists) | acc] end)
    |> Enum.join("")
  end
end
