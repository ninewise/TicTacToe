
# When we haven't been able to do any of the above tactics, we chose the
# center if it's free, and the first possible place otherwise.

s/\(|.\)-\(.|\)/\1O\2/; t output_next_turn

s/-/O/; t output_next_turn
