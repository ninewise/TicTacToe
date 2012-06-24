
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


# Excepts input of the form "---|---|---" where each dash can be replaced by an
# O or an X.

# When the game just enters through normal flow, we assume no special things
# happened, and we just have to prepare for a next move.

s/|/\n/g
p
d

# Now, the several special outputs:
:output_we_win

s/|/\n/g
s/.*/You lost:\n&/
p
d

:output_we_lose

s/.*/Congratulations: you won!/
p
d

:output_undecided

s/|/\n/g
s/.*/The game is undecided:\n&/
p
d
