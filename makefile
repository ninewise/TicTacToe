parts = \
process_input.sed \
check_loss.sed \
finishing_move.sed \
do_not_lose.sed \
otherwise.sed \
output.sed

all: main.sed

main.sed: $(parts)
	cat $(parts) > $@
	chmod a+x $@
