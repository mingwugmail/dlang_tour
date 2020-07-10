#!/usr/bin/env dub
/+ dub.sdl:
+/
import std.datetime;

class A {
	SysTime time;
	synchronized setTime(ref SysTime t) {
		cast()time = t;
	}
}

void main() {
	shared A a = new A();
	SysTime time;
	a.setTime(time);
}
