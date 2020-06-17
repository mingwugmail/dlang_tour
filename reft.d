import std.stdio;

// I'd consider this a D bug:
// https://forum.dlang.org/post/rcdvf7$1kv2$1@digitalmars.com
// https://forum.dlang.org/post/iukwgvhqessdunyolqmq@forum.dlang.org
// Essentially, your alias statement becomes:
// alias refInt = int;

alias refInt = ref int;

void f(refInt i) {
  i = 456;
}

void main() {
  int i = 123;
  writeln(i);  // 123
  f(i);
  writeln(i);  // 123! again
}
