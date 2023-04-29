defmodule GuessingGame do
  defguardp is_close_number(secret_number, guess)
            when secret_number + 1 === guess or secret_number - 1 === guess

  @spec compare(integer(), integer() | atom()) :: String.t()
  def compare(secret_number, guess \\ :no_guess)
  def compare(secret_number, guess) when secret_number == guess, do: "Correct"
  def compare(secret_number, guess) when is_close_number(secret_number, guess), do: "So close"

  def compare(secret_number, guess) when is_integer(guess) and secret_number - 1 > guess,
    do: "Too low"

  def compare(secret_number, guess) when is_integer(guess) and guess > secret_number + 1,
    do: "Too high"

  def compare(_secret_number, _guess), do: "Make a guess"
end
