# SmartEiffel/ the 1.1 compiler

Please install to try the visitor example.

FYI: I installed on MacOS; you may have trouble on other OS.


# visitor/ multiple inheritance: how Eiffel solve the diamond problem
```
$ compile  app.e -o app  # Eiffel compiler command
$ ./app
```

Eiffel is a compiled static typed language. All the class's memory layout is known
at compile time (as it's fully specified by the programmer in the source code).

BTW, many (if not all) Eiffel compilers actually compile Eiffel programs to C (as target language).


To see the generated C code:
```
$ compile_to_c app.e
```

