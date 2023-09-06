#!/bin/bash

#usage: in latex file, add 
#     \immediate{\write18{./gen_split_cmd.sh \thepage \ \jobname}}
# at the point you want the pdf to split
# Requires -shell-escape (not on by default in the makefile) passed to -latexmk

set -ex
echo $@

args=($1)

job=${args[1]}
pg=${args[0]}

echo $pg
echo $job

pg2=$((1+$pg))

echo "qpdf "$job".pdf --pages "$job".pdf 1-"$pg" -- "$job"_noappendices.pdf" > split_cmd.sh
echo "qpdf "$job".pdf --pages "$job".pdf "$pg2"-z -- "$job"_appendices.pdf" >> split_cmd.sh

chmod u+x split_cmd.sh

