#!/usr/bin/env dub
/+ dub.sdl:
+/

import core.atomic;
import std.algorithm;
import std.conv;
import std.stdio;
import std.math;

import std.experimental.checkedint;

void default_div() {
  long[] a = [-5000L, 0L];
  long   c = sum(a) / a.length;
  writeln(c);  // 9223372036854773308
}


alias Long = Checked!long;

void checked_div() {
  Long b = 1L;  // OK
//Long[] a = [-5000L, 0L];  // Error: cannot implicitly convert expression [-5000L, 0L] of type long[] to Checked!(long, Abort)[]
  Long[] a = [checked(-5000L), checked(0L)];
//auto   d = Long(sum(a) / a.length); // Error: template std.experimental.checkedint.Checked!(long, Abort).Checked.__ctor cannot deduce function from argument types !()(Checked!(ulong, Abort))
  Long   c = sum(a);
  c /= cast(long)(a.length);
  writeln(c);  // Checked!(long, Abort)(-2500)

//c /= a.length;  // Overflow on binary operator: long(-5000) / const(ulong)(2) checkedint.d(1247): Assertion failure
  writeln(b);
  b = 3L;
  writeln(b);
}


void use_checked() {
  long la, lb, lc;  // native
  Long ca, cb, cc;  // checkedint

  // 0. as array literal
  long[] larr = [1, 2, 3];
//Long[] carr = [1, 2, 3];  // Error: cannot implicitly convert expression [1, 2, 3] of type int[] to Checked!(long, Abort)[]
  Long[] carr = [checked(1L), checked(2L), checked(3L)];  // more verbose

  // 1. checkedint cannot be chain assigned
  la = lb = lc = 0;
//ca = cb = cc = 0;  // Error: expression cc.opAssign(0) is void and has no value
  ca = 0;  // have to do separately
  cb = 0;
  cc = 0;

  // 2. have to use .get to call math func
  writeln(std.math.sgn(la));
  writeln(std.math.abs(la));
//writeln(std.math.sgn(ca));  // Error: template std.math.sgn cannot deduce function from argument types !()(Checked!(long, Abort)), candidates are:
//writeln(std.math.abs(ca));  // Error: template instance std.math.abs!(Checked!(long, Abort)) error instantiating
  writeln(std.math.sgn(ca.get));  // .get
  writeln(std.math.abs(ca.get));  // .get

  // 3. no opBinaryLeft
  lc = la * lb;
//cc = la * cb;  // Error: can only * a pointer, not a int
  cc = cb * la;  // have to switch order

  // 4. std.conv don't work
  double d = 0;
  lb = d.to!long;
//cb = d.to!Long;  // Error: template instance std.conv.to!(Checked!(long, Abort)).to!double error instantiating
  cb = lround(d);

  lb = "0".to!long;
//cb = "0".to!Long; // Error: template std.conv.toImpl cannot deduce function from argument types !(Checked!(long, Abort))(string), candidates are:
  cb = "0".to!long; // work around ok

  // 5. cannot assign to shared
  static struct S {
    shared long sl;
    shared Long sL;
  }
  S s;
  s.sl = la;
//s.sL = la;  // Error: template std.experimental.checkedint.Checked!(long, Abort).Checked.opAssign cannot deduce function from argument types !()(long) shared, candidates are:
  cast()s.sL = la;  // need the `cast`

  // 6. format %d won't work
  writefln("%04d", la);      // output: 0000
//writefln("%04d", ca);      // Expected '%s' format specifier for type 'Checked!(long, Abort)'
  writefln("%s",   ca);      // output: Checked!(long, Abort)(0), can this be just be 0?
  writefln("%04d", ca.get);  // output: 0000

  // 7. atomic won't work
  core.atomic.atomicOp!"+="(s.sl, lb);
//core.atomic.atomicOp!"+="(s.sL, cb);  // Error: template instance core.atomic.atomicOp!("+=", Checked!(long, Abort), Checked!(long, Abort)) error instantiating
//core.atomic.atomicFetchAdd(s.sL, cb);  // Error: template core.atomic.atomicFetchAdd cannot deduce function from argument types !()(shared(Checked!(long, Abort)), Checked!(long, Abort)), candidates are:
}


void main() {
  default_div();
  checked_div();

  use_checked();
}
