#!/bin/bash
s_dir=$HOME/Berijects/notebackup/acm/
dir=$HOME/Berijects/C++/acm/
if [ -d $s_dir ]; then
	rm -r $dir
	cp -r $s_dir $HOME/Berijects/C++/
else
	rm -r $HOME/Berijects/C++/acm/
	mkdir -p $HOME/Berijects/C++/acm/output
fi
cd $HOME/Berijects/C++/acm
