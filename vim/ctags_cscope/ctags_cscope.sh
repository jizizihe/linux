#!/bin/sh
python3 ctags_cscope.py
cscope -Rbkq -i cscope.files
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
#ctags -R .
