defmodule Cell do

# neighbor state can have multiple definitions
# we want the state of each neighbor
# current coordinate, a direction / neighbor coordinate
##########
# nw - x - 1, y - 1
# north - x, y+1
# ne x + 1, y + 1
# west - x - 1 , y
# east - x + 1, y
# sw - x - 1, y - 1
# south - x, y-1
# se - x + 1, y - 1

#     n
#    xxx
# w  xox e
#    xxx
#     s

  def live_neighbors({x, y} = cell) do
    live_neighbors = 0

    if {x-1, y-1} == true, do: live_neighbors++
  end

# TODO: if no cell exists (boundary of the board)
# somehow stop so we don't yeet ourselves off the board
end
