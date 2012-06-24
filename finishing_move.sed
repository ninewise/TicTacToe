
# In this part, we assume we have input of the form "---|---|---" where each
# dash can be replaced by an X or an O. We are the O player, and check whether
# we can win the game in this turn.
#
# If we win, we jump to that part of the output.
# If we can't win, we just exit this part.

# Horizontal win.
s/OO[^|]/OOO/; t output_we_win
s/O[^|]O/OOO/; t output_we_win
s/[^|]OO/OOO/; t output_we_win

# Vertical win.
s/\(O..|O..|\).\(..\)/\1O\2/; t output_we_win
s/\(O..|\).\(..|O..\)/\1O\2/; t output_we_win
s/\(\).\(..|O..|O..\)/\1O\2/; t output_we_win
s/\(.O.|.O.|.\).\(.\)/\1O\2/; t output_we_win
s/\(.O.|.\).\(.|.O.\)/\1O\2/; t output_we_win
s/\(.\).\(.|.O.|.O.\)/\1O\2/; t output_we_win
s/\(..O|..O|..\).\(\)/\1O\2/; t output_we_win
s/\(..O|..\).\(|..O\)/\1O\2/; t output_we_win
s/\(..\).\(|..O|..O\)/\1O\2/; t output_we_win

# Diagonal win.
s/\(O..|.O.|..\).\(\)/\1O\2/; t output_we_win
s/\(O..|.\).\(.|..O\)/\1O\2/; t output_we_win
s/\(\).\(..|.O.|..O\)/\1O\2/; t output_we_win
s/\(..O|.O.|\).\(..\)/\1O\2/; t output_we_win
s/\(..O|.\).\(.|O..\)/\1O\2/; t output_we_win
s/\(..\).\(|.O.|O..\)/\1O\2/; t output_we_win

