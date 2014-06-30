#!/bin/bash

/usr/bin/diff "$1" "$2" | "$3/Contents/Resources/mate" --async
