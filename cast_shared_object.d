#!/usr/bin/env dub
/+ dub.sdl:
+/
/*
7FFFEEDE9670
7FFFEEDE9678
7FFFEEDE9680
7FFFEEDE9688
7FAC83A30000
7FAC83A30000
7FAC83A30000
7FAC83A30000
 */

import std;

class A {}

void main()
{
    A a = new A();
    A b = a;
    shared(A) c = cast(shared A) a;
    A d = cast(A) c;
    writeln(&a); // 7FFF0D776E20  stack *var*'s addr are different
    writeln(&b); // 7FFF0D776E28
    writeln(&c); // 7FFE15993F80
    writeln(&d); // 7FFE15993F88
    writeln(cast(void*)a); // 7FD1AB5AA000  all the *object* have the same addr
    writeln(cast(void*)b); // 7FD1AB5AA000
    writeln(cast(void*)c); // 7FD1AB5AA000
    writeln(cast(void*)d); // 7FD1AB5AA000
}

