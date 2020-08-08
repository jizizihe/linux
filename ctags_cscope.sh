#!/bin/sh
find . -name "*.h" -o -name "*.c" -o -name "*.cc"  -o -name "*.java"> cscope.files
cscope -Rbkq -i cscope.files
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
#ctags -R .
