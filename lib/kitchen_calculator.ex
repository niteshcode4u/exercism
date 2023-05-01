defmodule KitchenCalculator do
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
