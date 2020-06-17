#include <stdio.h>

typedef int& refInt;

void f(refInt i) {
  i = 456;
}

int main() {
  int i = 123;
  printf("%d\n", i);
  f(i);
  printf("%d\n", i);
}
