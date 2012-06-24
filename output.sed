
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
