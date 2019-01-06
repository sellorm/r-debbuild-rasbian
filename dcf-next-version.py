#!/usr/bin/env python
import deb822
import sys

path = sys.argv[1]

for paragraph in deb822.Deb822.iter_paragraphs(open(path)):
    for item in paragraph.items():
        if item[0] == 'Version':
            print int(item[1])+1
