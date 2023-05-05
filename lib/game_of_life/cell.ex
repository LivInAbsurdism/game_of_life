defmodule GameOfLife.Cell do
  alias GameOfLife.World
  def update_cell({row, col} = cell, cell_state, state) do
    live_neighbors = World.live_neighbors(state, {row, col})
    new_state = World.rule(cell_state, live_neighbors)
    {cell, new_state}
  end
end
