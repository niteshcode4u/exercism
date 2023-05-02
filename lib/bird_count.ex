defmodule BirdCount do
  @moduledoc """
    ## Instructions

    You're an avid bird watcher that keeps track of how many birds have visited your garden on any given day.

    You decided to bring your bird watching to a new level and implement a few tools that will help you track and process the data.

    You have chosen to store the data as a list of integers. The first number in the list is the number of birds that visited your garden today, the second yesterday, and so on.

    ## 1. Check how many birds visited today

    Implement the `BirdCount.today/1` function. It should take a list of daily bird counts and return today's count. If the list is empty, it should return `nil`.

    ```elixir
    BirdCount.today([2, 5, 1])
    # => 2
    ```

    ## 2. Increment today's count

    Implement the `BirdCount.increment_day_count/1` function. It should take a list of daily bird counts and increment the today's count by 1. If the list is empty, return `[1]`.

    ```elixir
    BirdCount.increment_day_count([4, 0, 2])
    # => [5, 0, 2]
    ```

    ## 3. Check if there was a day with no visiting birds

    Implement the `BirdCount.has_day_without_birds?/1` function. It should take a list of daily bird counts. It should return `true` if there was at least one day when no birds visited the garden, and `false` otherwise.

    ```elixir
    BirdCount.has_day_without_birds?([2, 0, 4])
    # => true

    BirdCount.has_day_without_birds?([3, 8, 1, 5])
    # => false
    ```

    ## 4. Calculate the total number of visiting birds

    Implement the `BirdCount.total/1` function. It should take a list of daily bird counts and return the total number that visited your garden since you started collecting the data.

    ```elixir
    BirdCount.total([4, 0, 9, 0, 5])
    # => 18
    ```

    ## 5. Calculate the number of busy days

    Some days are busier than others. A busy day is one where five or more birds have visited your garden.

    Implement the `BirdCount.busy_days/1` function. It should take a list of daily bird counts and return the number of busy days.

    ```elixir
    BirdCount.busy_days([4, 5, 0, 0, 6])
    # => 2
    ```
  """

  @spec today(maybe_improper_list) :: any
  def today([]), do: nil
  def today([head | _tail]), do: head

  @spec increment_day_count(list) :: list
  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  @spec has_day_without_birds?(any) :: boolean
  def has_day_without_birds?([]), do: false

  def has_day_without_birds?([head | tail]) do
    if head == 0, do: true, else: has_day_without_birds?(tail)
  end

  @spec total(any) :: number
  def total([]), do: 0
  def total([head | tail]), do: head + total(tail)

  @spec busy_days(list) :: any
  def busy_days(list), do: total_busy_days(list, 0)

  defp total_busy_days([], count), do: count

  defp total_busy_days([head | tail], count) do
    if head > 4,
      do: total_busy_days(tail, count + 1),
      else: total_busy_days(tail, count)
  end
end
