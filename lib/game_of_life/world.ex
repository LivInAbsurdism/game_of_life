defmodule GameOfLife.World do
 alias GameOfLife.Cell
 # board state, (current iteration of all cells)
 # this should iterate through itself and determine the new state while retaining the old.

  def new() do
    rows = 20
    cols = 40

    # initial = %{}
    # state =

    %{
      state: Map.new(state),
      rows: rows,
      cols: cols
    }
  end
  def rule(state, 2) do # state stays the same
    state
  end

  def rule(_state, 3) do # we stay alive
    true
  end

  def rule(_state, _neighbors) do # we die
    false
  end

  defp get(game, {r, c} = coordinates) do
    Map.get(game, coordinates, false)
  end

  defp cell(true) do
    "O"
  end

  defp cell(false) do
    "."
  end

  def live_neighbors(state, {row, col}) do
    count =
      for x <- -1..1, y <- -1..1, x != 0 || y != 0 do  # for values x of -1, 0, 1 and  y -1, 0, 1
        coord = {row + x, col + y}                     # current neighboring cell

        case Map.get(state, coord, 0) do               # retrieve cell state
          1 -> 1
          _ -> 0
        end
      end

      Enum.sum(count)                                  # sum the neighbors
  end

  def tick(state) do
    new_state =
      for {{row, col}, cell_state} <- state do
        {coords, new_cell_state} = Cell.update_cell({row,col}, cell_state, state)
        {coords, new_cell_state}
      end

      %{state | state: new_state}
  end
end
