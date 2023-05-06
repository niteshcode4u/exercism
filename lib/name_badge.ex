defmodule NameBadge do
  @spec print(integer() | nil, String.t(), nil | String.t()) :: String.t()
  def print(id, name, department) do
    department = if department, do: String.upcase(department), else: "OWNER"

    if is_nil(id) do
      "#{name} - #{department}"
    else
      "[#{to_string(id)}] - #{name} - #{department}"
    end
  end
end
