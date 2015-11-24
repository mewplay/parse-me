#include <stdint.h>

int seed = 1234;

// abs returns the absolute value of x.
int32_t abs(int32_t x) {
	if (x < 0) {
		return -x;
	}
	return x;
}

// rand returns the next pseudo-random number in the Borland C/C++ linear
// congruential generator sequence.
int32_t rand() {
	// multiplier: a = 0x15A4E35
	// increment:  c = 1
	seed = 0x15A4E35*seed + 1;
	return abs(seed);
}
