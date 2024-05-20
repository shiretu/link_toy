all: link_order1 link_order2

link_order1: file1.o file2.o main.o
	clang++ file1.o file2.o main.o -o link_order1

link_order2: file1.o file2.o main.o
	clang++ file2.o file1.o main.o -o link_order2

file1.o: file1.cpp
	clang++ -std=c++20 -g -Wall -Wextra -Wcast-align -Wformat=2 -Werror -Wfatal-errors -Wno-unused-parameter -Winit-self -Werror=type-limits -fno-omit-frame-pointer -o file1.o -c file1.cpp

file2.o: file2.cpp
	clang++ -std=c++20 -g -Wall -Wextra -Wcast-align -Wformat=2 -Werror -Wfatal-errors -Wno-unused-parameter -Winit-self -Werror=type-limits -fno-omit-frame-pointer -o file2.o -c file2.cpp

main.o: main.cpp
	clang++ -std=c++20 -g -Wall -Wextra -Wcast-align -Wformat=2 -Werror -Wfatal-errors -Wno-unused-parameter -Winit-self -Werror=type-limits -fno-omit-frame-pointer -o main.o -c main.cpp

clean:
	rm -rfv *.o link_order1 link_order2
