defmodule KitchenCalculator do
  @moduledoc """
    ## Instructions

    While preparing to bake cookies for your friends, you have found that you have to convert some of the measurements used in the recipe. Being only familiar with the metric system, you need to come up with a way to convert common US baking measurements to milliliters (mL) for your own ease.

    Use this conversion chart for your solution:

    | Unit to convert | volume | in milliliters (mL) |
    | --------------- | ------ | ------------------- |
    | mL              | 1      | 1                   |
    | US cup          | 1      | 240                 |
    | US fluid ounce  | 1      | 30                  |
    | US teaspoon     | 1      | 5                   |
    | US tablespoon   | 1      | 15                  |

    Being a talented programmer in training, you decide to use milliliters as a transition unit to facilitate the conversion from any unit listed to any other (even itself).

    ## 1. Get the numeric component from a volume-pair

    Implement the `KitchenCalculator.get_volume/1` function. Given a volume-pair tuple, it should return just the numeric component.

    ```elixir
    KitchenCalculator.get_volume({:cup, 2.0})
    # => 2.0
    ```

    ## 2. Convert the volume-pair to milliliters

    Implement the `KitchenCalculator.to_milliliter/1` function. Given a volume-pair tuple, it should convert the volume to milliliters using the conversion chart.

    Use multiple function clauses and pattern matching to create the functions for each unit. The atoms used to denote each unit are: `:cup`, `:fluid_ounce`, `:teaspoon`, `:tablespoon`, `:milliliter`. Return the result of the conversion wrapped in a tuple.

    ```elixir
    KitchenCalculator.to_milliliter({:cup, 2.5})
    # => {:milliliter, 600.0}
    ```

    ## 3. Convert the milliliter volume-pair to another unit

    Implement the `KitchenCalculator.from_milliliter/2` function. Given a volume-pair tuple and the desired unit, it should convert the volume to the desired unit using the conversion chart.

    Use multiple function clauses and pattern matching to create the functions for each unit. The atoms used to denote each unit are: `:cup`, `:fluid_ounce`, `:teaspoon`, `:tablespoon`, `:milliliter`

    ```elixir
    KitchenCalculator.from_milliliter({:milliliter, 1320.0}, :cup)
    # => {:cup, 5.5}
    ```

    ## 4. Convert from any unit to any unit

    Implement the `KitchenCalculator.convert/2` function. Given a volume-pair tuple and the desired unit, it should convert the given volume to the desired unit.

    ```elixir
    KitchenCalculator.convert({:teaspoon, 9.0}, :tablespoon)
    # => {:tablespoon, 3.0}
    ```
  """
  @milliliter_convertion %{milliliter: 1, cup: 240, fluid_ounce: 30, teaspoon: 5, tablespoon: 15}

  @spec get_volume({atom(), number()}) :: number()
  def get_volume({_unit, numeric_value}), do: numeric_value

  @spec to_milliliter(
          {:cup, number}
          | {:fluid_ounce, number}
          | {:milliliter, number}
          | {:tablespoon, number}
          | {:teaspoon, number}
        ) :: {:milliliter, number}
  def to_milliliter({unit, numeric_value}),
    do: {:milliliter, get_unit_convertion_with_milliliter(unit) * numeric_value}

  @spec from_milliliter(
          {:milliliter, number},
          :cup | :fluid_ounce | :milliliter | :tablespoon | :teaspoon
        ) ::
          {:cup, float}
          | {:fluid_ounce, float}
          | {:milliliter, float}
          | {:tablespoon, float}
          | {:teaspoon, float}
  def from_milliliter({:milliliter, numeric_value}, unit),
    do: {unit, numeric_value / get_unit_convertion_with_milliliter(unit)}

  @spec convert(
          {:cup, number}
          | {:fluid_ounce, number}
          | {:milliliter, number}
          | {:tablespoon, number}
          | {:teaspoon, number},
          :cup | :fluid_ounce | :milliliter | :tablespoon | :teaspoon
        ) ::
          {:cup, float}
          | {:fluid_ounce, float}
          | {:milliliter, float}
          | {:tablespoon, float}
          | {:teaspoon, float}
  def convert({unit_convert_from, numeric_value}, unit_convert_to) do
    {unit_convert_from, numeric_value}
    |> to_milliliter()
    |> from_milliliter(unit_convert_to)
  end

  defp get_unit_convertion_with_milliliter(unit), do: @milliliter_convertion[unit]
end
