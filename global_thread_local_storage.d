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

immutable int n = 10;  // all threads see this same thing

int global_tls = 0;  // global thread local storage: each thread has its own copy, even it seems to be a "global" variable

void threadInc() {
  foreach (i; 0..n) {
    global_tls++;
  }
  writeln("threadInc: ", global_tls);  // output: threadInc: 10
}

void threadDec() {
  foreach (i; 0..n) {
    global_tls--;
  }
  writeln("threadDec:", global_tls);  // output: threadDec:-10
}


void main() {
  spawn(&threadInc);
  spawn(&threadDec);

  writeln("main:", global_tls);  // output: main:0
}
