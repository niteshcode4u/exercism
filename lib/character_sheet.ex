defmodule RPG.CharacterSheet do
  @moduledoc """
    ## Instructions

    You and your friends love to play pen-and-paper role-playing games, but you noticed that it's difficult to get new people to join your group. They often struggle with character creation. They don't know where to start. To help new players out, you decided to write a small program that will guide them through the process.

    ## 1. Welcome the new player

    Implement the `RPG.CharacterSheet.welcome/0` function. It should print a welcome message, and return `:ok`.

    ```elixir
    RPG.CharacterSheet.welcome()
    # > Welcome! Let's fill out your character sheet together.
    # => :ok
    ```

    ## 2. Ask for the character's name

    Implement the `RPG.CharacterSheet.ask_name/0` function. It should print a question, wait for an answer, and return the answer without leading and trailing whitespace.

    ```elixir
    RPG.CharacterSheet.ask_name()
    # > What is your character's name?
    # < Mathilde
    # => "Mathilde"
    ```

    ## 3. Ask for the character's class

    Implement the `RPG.CharacterSheet.ask_class/0` function. It should print a question, wait for an answer, and return the answer without leading and trailing whitespace.

    ```elixir
    RPG.CharacterSheet.ask_class()
    # > What is your character's class?
    # < healer
    # => "healer"
    ```

    ## 4. Ask for the character's level

    Implement the `RPG.CharacterSheet.ask_level/0` function. It should print a question, wait for an answer, and return the answer as an integer.

    ```elixir
    RPG.CharacterSheet.ask_level()
    # > What is your character's level?
    # < 2
    # => 2
    ```

    ## 5. Combine previous steps into one

    Implement the `RPG.CharacterSheet.run/0` function. It should welcome the new player, ask for the character's name, class, and level, and return the character sheet as a map. It should also print the map with the label "Your character".

    ```elixir
    RPG.CharacterSheet.run()
    # > Welcome! Let's fill out your character sheet together.
    # > What is your character's name?
    # < Mathilde
    # > What is your character's class?
    # < healer
    # > What is your character's level?
    # < 2
    # > Your character: %{class: "healer", level: 2, name: "Mathilde"}
    # => %{class: "healer", level: 2, name: "Mathilde"}
    ```
  """

  @spec welcome :: :ok
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  @spec ask_name :: binary
  def ask_name() do
    character_name = IO.gets("What is your character's name?\n")
    String.trim(character_name)
  end

  @spec ask_class :: binary
  def ask_class() do
    character_class = IO.gets("What is your character's class?\n")
    String.trim(character_class)
  end

  @spec ask_level :: integer
  def ask_level() do
    character_level = IO.gets("What is your character's level?\n")
    character_level |> String.trim() |> String.to_integer()
  end

  @spec run :: map()
  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()

    character_map = %{name: name, class: class, level: level}

    IO.inspect(character_map, label: "Your character")
  end
end
