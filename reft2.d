// https://forum.dlang.org/post/shgqnxbzusxjgpdufqne@forum.dlang.org
// ugly work-around
import std.stdio;

void foo(T)(auto ref T v) if (is(T : int) == __traits(isRef, v)) {
    writeln(__traits(isRef, v) ? "by ref" : "by value");
    v = 456;
}

void main() {
    int a = 123;
    writeln(a);
    foo(a); // by ref
    // foo(10); // error by value
    writeln(a);

    float b = 123;
    // foo(b); // error by ref
    writeln(b);
    foo(10.0f); // by value
    writeln(b);
}

