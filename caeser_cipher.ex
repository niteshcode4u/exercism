defmodule CaesarCapher do
@doc """
    Example:
        iex> RotationalCipher.rotate("Attack at dawn", 13)
        "Nggnpx ng qnja"
"""
    def rotate(_, value) when value < 0, do: IO.puts("Value must be positive")
    def rotate(_, value) when value >= 26, do: IO.puts("Value should be less than 26")
    def rotate(text, value) do
        text
        |> String.upcase
        |> String.codepoints
        |> _rotate(value)clear
        |> Enum.join
    end

    defp _rotate(codepoints, value), do: parmap(codepoints, &(rotate_point(&1, value)))

    defp parmap(list, f) do
        me = self()
        list
        |> Enum.map(fn(i) -> 
            spawn_link fn -> (send me, { self(), f.(i)}) end
        end)
        |> Enum.map(fn (pid) ->
            receive do { ^pid, result } -> result end 
        end)
    end

    defp rotate_point(" ", _), do: " "
    defp rotate_point("\n", _), do: " "
    defp rotate_point(codepoint, value) do
        << p >> = codepoint
        << _rotate_point(p + value) >>
    end

    defp _rotate_point(p) when p > 90, do: p - 26
    defp _rotate_point(p), do: p
end