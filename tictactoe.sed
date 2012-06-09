#!/bin/sed

# Game initialization.
1 {
    x
    s/^.*$/---|---|---=X/
    x
}

# Check is game is going.
x
/ended/b ended
x

# Input verification
/^[123],[123]$/!b incorrect_input

# Input processing
G
s/1,1\n\(\)-\(..|...|...\)=\([XO]\)/\1\3\2=\3/; t processed
s/1,2\n\(.\)-\(.|...|...\)=\([XO]\)/\1\3\2=\3/; t processed
s/1,3\n\(..\)-\(|...|...\)=\([XO]\)/\1\3\2=\3/; t processed

s/2,1\n\(...|\)-\(..|...\)=\([XO]\)/\1\3\2=\3/; t processed
s/2,2\n\(...|.\)-\(.|...\)=\([XO]\)/\1\3\2=\3/; t processed
s/2,3\n\(...|..\)-\(|...\)=\([XO]\)/\1\3\2=\3/; t processed

s/3,1\n\(...|...|\)-\(..\)=\([XO]\)/\1\3\2=\3/; t processed
s/3,2\n\(...|...|.\)-\(.\)=\([XO]\)/\1\3\2=\3/; t processed
s/3,3\n\(...|...|..\)-\(\)=\([XO]\)/\1\3\2=\3/; t processed

b unprocessed

:processed

# Check for winner.
/\([^-]\)\1\1/b victory
/\([^-]\)..|\1..|\1../b victory
/.\([^-]\).|.\1.|.\1./b victory
/..\([^-]\)|..\1|..\1/b victory
/\([^-]\)..|.\1.|..\1/b victory
/..\([^-]\)|.\1.|\1../b victory

# Change player
s/=X/=tO/
s/=O/=tX/
s/=t/=/

# Remember current field
h

# Output field
s/|/\n/g
s/=/\nNext turn: /
p

# End program, read the next line.
d

#
# Helping functions:
#
:incorrect_input
i\
Please use input like 'row,column'
d

:unprocessed
i\
You probably tried putting double. Not nice.
d

:victory
s/.*=\(.\)/Congratulations, \1, you won!/
x
s/.*/ended/
x
p
d

:ended
i\
The game's over, you can just quit, OK?
x
d
