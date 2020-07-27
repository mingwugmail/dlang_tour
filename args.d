#!/usr/bin/env dub
/+ dub.sdl:
+/

// dmd args.d
// gdb -ex=r --args  ./args a b c

import std.algorithm;
import std.stdio;

void main(string[] args) {
  args.each!writeln;
}
