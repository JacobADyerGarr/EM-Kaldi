#!/bin/sh

corpus=$1

input=./corpora/${1}.txt
output=./language_models/${1}.gz
vocab=/disk/scratch2/s1620398/kaldi/egs/ami/s5b/data/local/lm/wordlist

./ngram-count -lm ${output} -kndiscount -order 3 -text ${input} -unk -map-unk "<unk>" -sort
