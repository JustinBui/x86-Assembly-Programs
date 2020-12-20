#include <stdio.h>

extern "C" double convert();

int main() {
	double result = -1;
	result = convert();
	printf("Main received %lf. Main will now return 0 to the operating system.\n", result);
	return 0;
}
