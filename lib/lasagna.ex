defmodule Lasagna do
  # Please define the 'expected_minutes_in_oven/0' function
  @spec expected_minutes_in_oven :: 40
  def expected_minutes_in_oven, do: 40

  # Please define the 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(time_in_minutes), do: 40 - time_in_minutes

  # Please define the 'preparation_time_in_minutes/1' function
  @spec preparation_time_in_minutes(number) :: number
  def preparation_time_in_minutes(layers), do: 2 * layers

  # Please define the 'total_time_in_minutes/2' function
  @spec total_time_in_minutes(number, number) :: number
  def total_time_in_minutes(layers, number_of_minutes), do: 2 * layers + number_of_minutes

  # Please define the 'alarm/0' function
  @spec alarm :: <<_::40>>
  def alarm, do: "Ding!"
end
