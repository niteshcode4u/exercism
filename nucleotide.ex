defmodule NucleotideCount do
# http://exercism.io/tracks/elixir/exercises/nucleotide-count go to this link to match with your solution
  # @nucleotides %{"?A" => "A", "?C" => "C", "?G" => "G", "?T" => "T"}
  #
  # def count(strand, nucleotide) do
  #   strand = strand |> String.split("")
  #   nutide = @nucleotides[nucleotide]
  #   count = case nutide do
  #     "A" ->
  #       Enum.filter(strand, fn(x) -> x == "A" end) |> Enum.count
  #     "C" ->
  #       Enum.filter(strand, fn(x) -> x == "C" end) |> Enum.count
  #     "G" ->
  #       Enum.filter(strand, fn(x) -> x == "G" end) |> Enum.count
  #     "T" ->
  #       Enum.filter(strand, fn(x) -> x == "T" end) |> Enum.count
  #   end
  #   count
  # end
  @nucleotides [?A, ?C, ?T, ?G]

  def count(strand, nucleotide) do
    Enum.count(strand, fn(x) -> x == nucleotide end)
  end

  def histogram(strand) do
    # strand = strand |> String.split("")
    # response = %{
    #   "?A" => Enum.filter(strand, fn(x) -> x == "A" end) |> Enum.count,
    #   "?C" => Enum.filter(strand, fn(x) -> x == "C" end) |> Enum.count,
    #   "?G" => Enum.filter(strand, fn(x) -> x == "G" end) |> Enum.count,
    #   "?T" => Enum.filter(strand, fn(x) -> x == "T" end) |> Enum.count,
    # }
    # response

    for nucleotide <- @nucleotides, into: %{}, do:
            {nucleotide, NucleotideCount.count(strand, nucleotide)}
  end
end
