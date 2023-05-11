defmodule GameOfLife.Game do
  @rows 5
  @cols 5

  def new() do
    %{
      {2, 3} => true,
      {3, 3} => true,
      {4, 3} => true
    }
  end

  defp rule(state, 2) do
    state
  end

  defp rule(_state, 3) do
    true
  end

  defp rule(_state, _neighbors) do
    false
  end

  defp get(game, {r, c} = coordinates) do
    Map.get(game, coordinates, false)
  end

  def display(game) do
    1..@rows
    |> Enum.map(fn r -> display_row(game, r) end)
    |> Enum.join("\n")
  end

  def display_row(game, row) do
    1..@cols
    |> Enum.map(fn c -> get(game, {row, c}) |> cell() end)
  end

  defp cell(true) do
    "O"
  end

  defp cell(false) do
    "."
  end
end
