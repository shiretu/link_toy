This demo evidentiate the issue with using inline header-only functions which are using non-namespaced calls. It makes them fall on one variant or another.

For example, calling `pow` in such a file, depending on the bad habbit of who includes that file, we might end up using either `std::pow()` or `pow()` from libc. This happens when we do `using namespace std;` which is a quite big code-smell when done at global level.

Overall, to clearly see the issue, I have compiled 2 cpp files which are using such a bad header, and then created 2 binaries out of this 2 compiled files, but different link order.

So we compile once, but then use the same compiled object files to produce 2 binaries, with different link order:

```
shiretu@templar:/private/tmp/toy (master)$ make
clang++ -std=gnu++20 -g -Wall ...  -fno-omit-frame-pointer -o file1.o -c file1.cpp
clang++ -std=gnu++20 -g -Wall ...  -fno-omit-frame-pointer -o file2.o -c file2.cpp
clang++ -std=gnu++20 -g -Wall ...  -fno-omit-frame-pointer -o main.o -c main.cpp
clang++ file1.o file2.o main.o -o link_order1
clang++ file2.o file1.o main.o -o link_order2
```

We expect that the resulted binaries to behave the same, since they were compiled once and reused. Unfortyunately, the link order now influences our code. Here is how:

```
shiretu@templar:/private/tmp/toy (master)$ ./link_order1
Hi there Alice
Hi there Alice
shiretu@templar:/private/tmp/toy (master)$ ./link_order2
Hi there Bob
Hi there Bob
```
