defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance_from_centre = :math.sqrt(:math.pow(x, 2) + :math.pow(y, 2))

    cond do
      distance_from_centre > 10 -> 0
      distance_from_centre > 5 -> 1
      distance_from_centre > 1 -> 5
      true -> 10
    end
  end
end
