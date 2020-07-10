#!/usr/bin/env dub
/+ dub.sdl:
+/
import std.datetime;

class A {
	SysTime time;
	synchronized setTime(ref SysTime t) {
		// have to cast to compile
		// https://forum.dlang.org/post/sfkkxssakgrdmyuywfnm@forum.dlang.org
		cast()time = t;
	}
}

void main() {
	shared A a = new A();
	SysTime time;
	a.setTime(time);
}
