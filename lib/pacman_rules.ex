defmodule PacmanRules do
  @moduledoc """
    ## Instructions

    In this exercise, you need to translate some rules from the classic game Pac-Man into Elixir functions.

    You have four rules to translate, all related to the game states.

    > Don't worry about how the arguments are derived, just focus on combining the arguments to return the intended result.

    ## 1. Define if Pac-Man eats a ghost

    Define the `Rules.eat_ghost?/2` function that takes two arguments (_if Pac-Man has a power pellet active_ and _if Pac-Man is touching a ghost_) and returns a boolean value if Pac-Man is able to eat the ghost. The function should return true only if Pac-Man has a power pellet active and is touching a ghost.

    ```elixir
    Rules.eat_ghost?(false, true)
    # => false
    ```

    ## 2. Define if Pac-Man scores

    Define the `Rules.score?/2` function that takes two arguments (_if Pac-Man is touching a power pellet_ and _if Pac-Man is touching a dot_) and returns a boolean value if Pac-Man scored. The function should return true if Pac-Man is touching a power pellet or a dot.

    ```elixir
    Rules.score?(true, true)
    # => true
    ```

    ## 3. Define if Pac-Man loses

    Define the `Rules.lose?/2` function that takes two arguments (_if Pac-Man has a power pellet active_ and _if Pac-Man is touching a ghost_) and returns a boolean value if Pac-Man loses. The function should return true if Pac-Man is touching a ghost and does not have a power pellet active.

    ```elixir
    Rules.lose?(false, true)
    # => true
    ```

    ## 4. Define if Pac-Man wins

    Define the `Rules.win?/3` function that takes three arguments (_if Pac-Man has eaten all of the dots_, _if Pac-Man has a power pellet active_, and _if Pac-Man is touching a ghost_) and returns a boolean value if Pac-Man wins. The function should return true if Pac-Man has eaten all of the dots and has not lost based on the arguments defined in part 3.

    ```elixir
    Rules.win?(false, true, false)
    # => false
    ```
  """

  @spec eat_ghost?(boolean, any) :: any
  def eat_ghost?(power_pellet_active, touching_ghost) do
    power_pellet_active and touching_ghost
  end

  @spec score?(boolean, any) :: any
  def score?(touching_power_pellet, touching_dot) do
    touching_power_pellet or touching_dot
  end

  @spec lose?(any, boolean) :: boolean
  def lose?(power_pellet_active, touching_ghost) do
    touching_ghost and not power_pellet_active
  end

  @spec win?(boolean, any, any) :: boolean
  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    has_eaten_all_dots and not lose?(power_pellet_active, touching_ghost)
  end
end
