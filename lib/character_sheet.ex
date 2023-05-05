defmodule RPG.CharacterSheet do
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
