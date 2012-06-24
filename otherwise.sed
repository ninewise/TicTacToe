
# When we haven't been able to do any of the above tactics, we chose the
# center if it's free.

s/\(|.\)-\(.|\)/\1O\2/; t output_next_turn

# If the center's occupied by X, we chose the upperleft.

/|.X.|/s/^-/O/; t output_next_turn

# We take up the spot next to an O next.

s/-O/OO/; t output_next_turn

# Right otherwise

s/O-/OO/; t output_next_turn

# First open.

s/-/O/; t output_next_turn
