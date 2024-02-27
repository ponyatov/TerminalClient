#include <hello.hpp>

int main(int argc, char *argv[]) {  //
    for (int i = 0; i < argc; i++) arg(i, argv[i]);
}

void arg(int argc, char argv[]) {  //
    printf("argv[%i] = <%s>\n", argc, argv);
}
