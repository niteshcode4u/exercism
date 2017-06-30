defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """

  @actions ["wink", "double blink", "close your eyes", "jump"]

  @spec commands(code :: integer) :: list(String.t())
  def commands(code),
    do: code |> flags |> commands(@actions, []) |> Enum.reverse

  defp flags(code),
    do: code
        |> Integer.to_string(2)
        |> String.graphemes
        |> Enum.reverse
        |> Enum.map(fn x -> String.to_integer(x) end)

  defp commands([], _, acc), do: acc
  defp commands([1|_], [], acc), do: Enum.reverse(acc)
  defp commands(_, [], acc), do: acc
  defp commands([1|code], [action|actions], acc),
    do: commands(code, actions, [action|acc])
  defp commands([_|code], [_|actions], acc),
    do: commands(code, actions, acc)
end
