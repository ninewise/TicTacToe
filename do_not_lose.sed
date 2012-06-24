
# In this part, we try to hinder the other players, by placing an O where he
# could be placing his third X. Pretty similar to winning ourselfs.

# horizontal win.
s/XX-/XXO/; t output_next_turn
s/X-X/XOX/; t output_next_turn
s/-XX/OXX/; t output_next_turn

# vertical win.
s/\(X..|X..|\)-\(..\)/\1O\2/; t output_next_turn
s/\(X..|\)-\(..|X..\)/\1O\2/; t output_next_turn
s/\(\)-\(..|X..|X..\)/\1O\2/; t output_next_turn
s/\(.X.|.X.|.\)-\(.\)/\1O\2/; t output_next_turn
s/\(.X.|.\)-\(.|.X.\)/\1O\2/; t output_next_turn
s/\(.\)-\(.|.X.|.X.\)/\1O\2/; t output_next_turn
s/\(..X|..X|..\)-\(\)/\1O\2/; t output_next_turn
s/\(..X|..\)-\(|..X\)/\1O\2/; t output_next_turn
s/\(..\)-\(|..X|..X\)/\1O\2/; t output_next_turn

# diagonal win.
s/\(X..|.X.|..\)-\(\)/\1O\2/; t output_next_turn
s/\(X..|.\)-\(.|..X\)/\1O\2/; t output_next_turn
s/\(\)-\(..|.X.|..X\)/\1O\2/; t output_next_turn
s/\(..X|.X.|\)-\(..\)/\1O\2/; t output_next_turn
s/\(..X|.\)-\(.|X..\)/\1O\2/; t output_next_turn
s/\(..\)-\(|.X.|X..\)/\1O\2/; t output_next_turn

