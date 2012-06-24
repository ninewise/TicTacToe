#!/bin/sed -f

# First of all, initialize the game.

1 {
    x
    s/.*/---|---|---/
    x
}

# We start by processing input. We except input of the form "x,y", where x and
# y are 1, 2 or 3.

/^[123],[123]$/!b output_wrong_format

# Retrieve the situation from the holdspace.
G

/1,1/ { s/1,1\n\(\)-\(..|...|...\)/\1X\2/; t processed }
/1,2/ { s/1,2\n\(.\)-\(.|...|...\)/\1X\2/; t processed }
/1,3/ { s/1,3\n\(..\)-\(|...|...\)/\1X\2/; t processed }

/2,1/ { s/2,1\n\(...|\)-\(..|...\)/\1X\2/; t processed }
/2,2/ { s/2,2\n\(...|.\)-\(.|...\)/\1X\2/; t processed }
/2,3/ { s/2,3\n\(...|..\)-\(|...\)/\1X\2/; t processed }

/3,1/ { s/3,1\n\(...|...|\)-\(..\)/\1X\2/; t processed }
/3,2/ { s/3,2\n\(...|...|.\)-\(.\)/\1X\2/; t processed }
/3,3/ { s/3,3\n\(...|...|..\)-\(\)/\1X\2/; t processed }

b output_spot_occupied

:processed
