#pragma once

#include <stdio.h>

struct S1 {
  S1() { fprintf(stderr, "S1 is not so global %p\n", this); }
};

const S1 globalS1;

struct S2 {
  S2() { fprintf(stderr, "S2 is really global %p\n", this); }
};

struct global_stuff {
  static const inline S2 s;
};

inline const char *get_name() { return SOME_NAME; }
