#!/usr/bin/env dub
/+ dub.sdl:
+/

/* this program will output:
main:0
threadInc: 10
threadDec:-10
 */

import std.concurrency;
import std.stdio;
import core.atomic;
import core.thread;

immutable int n = 10;  // all threads see this same thing

int global_tls = 0;  // global thread local storage: each thread has its own copy, even it seems to be a "global" variable

class Foo {
  static int static_class_var_is_also_tls = 0;
  static shared int static_shared_class_var = 0;
}

void threadInc() {
  foreach (i; 0..n) {
    global_tls++;
    Foo.static_class_var_is_also_tls++;
    // Foo.static_shared_class_var++;  // won't compile
    atomicOp!"+="(Foo.static_shared_class_var, 1);
    Thread.yield();
  }
  writeln("threadInc: ", global_tls, Foo.static_class_var_is_also_tls, Foo.static_shared_class_var);  // output: threadInc: 10
}

void threadDec() {
  foreach (i; 0..n) {
    global_tls--;
    Foo.static_class_var_is_also_tls--;
    // Foo.static_shared_class_var--;  // Error: read-modify-write operations are not allowed for shared variables.
    atomicOp!"-="(Foo.static_shared_class_var, 1);
    Thread.yield();
  }
  writeln("threadDec:", global_tls, Foo.static_class_var_is_also_tls, Foo.static_shared_class_var);  // output: threadDec:-10
}


void main() {
  spawn(&threadInc);
  spawn(&threadDec);
  thread_joinAll();

  writeln("main:", global_tls, Foo.static_class_var_is_also_tls, Foo.static_shared_class_var);  // output: main:0
}
