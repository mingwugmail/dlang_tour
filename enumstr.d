#!/usr/bin/env dub
/+ dub.sdl:
+/

import std.stdio;
import std.conv;

enum Values { One = 1, Two = 2 }

void main(){
  Values o = Values.One;
  writeln(o);
  writeln(std.conv.to!string(o));
  writeln(o==1);
}
