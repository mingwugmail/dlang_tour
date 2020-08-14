#!/usr/bin/env dub
/+ dub.sdl:
+/

import std.algorithm;
import std.stdio;

import std.experimental.checkedint;

void default_div() {
  long[] a = [-5000L, 0L];
  long   c = sum(a) / a.length;
  writeln(c);  // 9223372036854773308
}

void checked_div() {
  alias Long = Checked!long;
  Long[] a = [checked(-5000L), checked(0L)];
//Long   c = sum(a) / a.length; // Error: template std.experimental.checkedint.Checked!(long, Abort).Checked.__ctor cannot deduce function from argument types !()(Checked!(ulong, Abort))
  Long   c = sum(a);
  c /= cast(long)(a.length);
  writeln(c);  // Checked!(long, Abort)(-2500)

  c /= a.length;  // Overflow on binary operator: long(-5000) / const(ulong)(2) checkedint.d(1247): Assertion failure
}

void main() {
  default_div();
  checked_div();
}
