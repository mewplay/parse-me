# Make dependencies:
# * sar
#    - install: go get github.com/mewkiz/cmd/sar

all: rand.ll

%.ll: %.c
	clang -S -emit-llvm -o $@ $<
	opt -S --mem2reg -o $@ $@
	sar -i "\ntarget.*" "" $@
	sar -i "\nattributes.*" "" $@
	sar -i "\n!.*" "" $@
	sar -i "\\\) #[0-9]+" ")" $@
	sar -i "\n\n\n\n" "\n" $@
