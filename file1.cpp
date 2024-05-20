#define SOME_NAME "Alice"

#include "file1.h"
#include "badheader.h"
#include <stdio.h>

void say_hi_1() {
  const char *pName = get_name();
  fprintf(stderr, "Hi there %s\n", pName);
}
