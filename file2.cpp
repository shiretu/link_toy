#define SOME_NAME "Bob"

#include "file2.h"
#include "badheader.h"
#include <stdio.h>

void say_hi_2() {
  const char *pName = get_name();
  fprintf(stderr, "Hi there %s\n", pName);
}
