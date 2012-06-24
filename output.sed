
# Excepts input of the form "---|---|---" where each dash can be replaced by an
# O or an X.

# When the game just enters through normal flow, we assume no special things
# happened, and we just have to prepare for a next move.

:output_next_turn

h
s/|/\n/g
p
d

# Now, the several special outputs:
:output_we_win

s/|/\n/g
s/.*/You lost:\n&/
q

:output_we_lose

s/.*/Congratulations: you won!/
q

:output_undecided

s/|/\n/g
s/.*/The game is undecided:\n&/
q

:output_wrong_format

s/.*/Wrong input, try again!/
p
b try_again

:output_spot_occupied
s/.*/That spot's occupied, try again!/
p
b try_again

:try_again
g
d
